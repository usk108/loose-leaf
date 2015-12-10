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
    html = ApplicationController.helpers.markdown self.text
    # メモ(HTML)の全体
    # この要素をたどっていくことで対象のareaを取得する
    doc = Nokogiri::HTML.parse(html)

    # 検索対象のxpathを指定する（完全一致）
    d_path = []
    (doc/'//*/text()').select{|t| t.text == keyword}.map{|t| d_path.push(t.path) }

    result_html = []
    for i in 0...d_path.count do
      binding.pry
      path = d_path[i].gsub(/\/text\(\)/,"")

      # keywordを含むDOM element
      # この後を順番に見ていき、自身以上の見出しに出会った段階で探索を終える
      d = doc.at_xpath(path)

      nextSib = d.next_sibling
      result = Nokogiri::HTML.parse("<div></div>")
      res_title = result.at_xpath('//div')
      while nextSib && explore_end?(d.name, nextSib.name) do
        res_title.add_next_sibling(nextSib)
        res_title = nextSib
        nextSib = d.next_sibling
      end

      full_html = result.inner_html
      result_html[i] = full_html.gsub(/\n<div><\/div>\n\n|<html><body>|<\/body><\/html>/,"")
    end

    # 複数なら間に線でも入れておく
    if d_path.count == 1
      result_html[0]
    else
      result_html.join("<hr>")
    end
  end

  def show_date
    "#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end


  def explore_end?(target_tag, current_tag)
    # binding.pry
    if /h(\d)/ === target_tag
      target_tag_number = $1.to_i
    end
    if /h(\d)/ === current_tag
      current_tag_number = $1.to_i
    end
    if target_tag_number && current_tag_number
      target_tag_number < current_tag_number
    else
      true
    end
  end
end
