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

  def show_date
    "#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end
end
