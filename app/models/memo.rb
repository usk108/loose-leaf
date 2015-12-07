# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  date       :datetime
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Memo < ActiveRecord::Base
  validates :text, presence: true
  belongs_to :user

  include Elasticsearch::Model

  # TODO: sidekiqで非同期にインデックスできるようにする
  include Elasticsearch::Model::Callbacks

  index_name "memo_#{Rails.env}" #インデックス名を指定

  # インデックス設定とマッピング(RDBでいうスキーマ)を設定
  settings do
    mappings dynamic: 'false' do # デフォルトでマッピングが自動作成されるがそれを無効にする
      indexes :text, analyzer: 'kuromoji'
      indexes :date, type: 'date', format: 'date_time'
      indexes :created_at, type: 'date', format: 'date_time'
      indexes :updated_at, type: 'date', format: 'date_time'
    end
  end

  # ページの表示件数を追加
  PER_PAGES = [14, 31, 365]

  # デフォルトの１ページの表示件数
  paginates_per PER_PAGES.first

  # インデクシング時に呼び出されるメソッド
  def as_indexed_json(options = {})
    attributes
      .symbolize_keys
      .slice(:text, :date, :created_at, :updated_at)
  end

  def self.search(params = {})
    keyword = params[:q]

    search_definition = Elasticsearch::DSL::Search.search {
      query{
        if keyword.present?
          simple_query_string{
            query keyword
            fields %w{ text }
          }
        else
          match_all
        end
      }
    }

    __elasticsearch__.search(search_definition)
  end

  def extract_area(keyword)
    result = Nokogiri::HTML.parse("<div></div>")
    res_title = result.at_xpath('//div')
    html = ApplicationController.helpers.markdown self.text
    doc = Nokogiri::HTML.parse(html)
    # 検索対象のxpathを指定する（完全一致）
    (doc/'//*/text()').select{|t| t.text == keyword}.map{|t| @d_path = t.path}
    path = @d_path.gsub(/\/text\(\)/,"")
    d = doc.at_xpath(path)
    @nextSib = d.next_sibling
    while d.name != @nextSib.name do
      res_title.add_next_sibling(@nextSib)
      res_title = @nextSib
      @nextSib = d.next_sibling
    end
    full_html = result.inner_html
    @result_html = full_html.gsub(/\n<div><\/div>\n\n|<html><body>|<\/body><\/html>/,"")
  end

  # def extract_area(keyword)
  #   result = Nokogiri::HTML.parse("<div></div>")
  #   res_title = result.at_xpath('//div')
  #   html = ApplicationController.helpers.markdown self.text
  #   doc = Nokogiri::HTML.parse(html)
  #   # 検索対象のxpathを指定する（完全一致）
  #   (doc/'//*/text()').select{|t| t.text == keyword}.map{|t| @d_path = t.path}
  #   path = @d_path.gsub(/\/text\(\)/,"")
  #   d = doc.at_xpath(path)
  #   @nextSib = d.next_sibling
  #   firstflg = true
  #   binding.pry
  #   while d.name != @nextSib.name do
  #     if(@nextSib.present?)
  #       if(firstflg)
  #         res_title.add_child(@nextSib)
  #         firstflg = false
  #       else
  #         res_title.add_next_sibling(@nextSib)
  #       end
  #     end
  #     res_title = @nextSib
  #     @nextSib = d.next_sibling
  #   end
  #   full_html = result.inner_html
  #   @result_html = full_html.gsub(/<html><body>|<\/body><\/html>/,"")
  # end

  def show_date
    "#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end
end
