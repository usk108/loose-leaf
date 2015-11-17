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

  index_name "memo_#{Rails.env}" #インデックス名を指定

  # インデックス設定とマッピング(RDBでいうスキーマ)を設定
  settings do
    mappings dynamic: 'false' do # デフォルトでマッピングが自動作成されるがそれを無効にする
      # indexesメソッドでインデックスする値を定義します。
      # analyzer: インデクシング時、検索時に使用するアナライザーを指定します。指定しない場合、グローバルで設定されているアナライザーが利用されます。
      # kuromojiは日本語のアナライザーです。
      indexes :text, analyzer: 'kuromoji'

      # date型として定義
      # formatは日付のフォーマットを指定(2015-10-16T19:26:03.679Z)
      indexes :date, type: 'date', format: 'date_time'
      indexes :created_at, type: 'date', format: 'date_time'
      indexes :updated_at, type: 'date', format: 'date_time'
    end
  end

  # インデクシング時に呼び出されるメソッド
  # マッピングのデータを返すようにする
  def as_indexed_json(options = {})
    attributes
      .symbolize_keys
      .slice(:text, :date, :created_at, :updated_at)
  end

  def self.search(params = {})
    # 検索パラメータを取得
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

    # 検索クエリをなげて結果を表示
    # __elasticsearch__にElasticsearchを操作するたくさんのメソッドが定義されている
    __elasticsearch__.search(search_definition)
  end

  def show_date
    "#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end
end
