# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  # すべてのレコードを削除する
  Memo.delete_all

  # ダミーデータ作成
  @user = User.create(:email => 'hogehoge@hoge.com', :password => 'hugahuga')
  14.times do |n|
    date  = n.day.ago
    #       sentence  = "
    # # 研究
    # ## アイデア
    # - アイデアその1-#{n}
    # - アイデアその2-#{n}
    # - アイデアその3-#{n}
    #   - 先生のコメント
    
    #   > 絵を描いたほうがいい

    # ## TODO
    # - 事務処理-#{n}
    # - 研究相談-#{n}

    # ## DONE
    # - プロトタイプ作成-#{n}
    #       "
    text = "# 研究\r\n## アイデア\r\n- アイデアその1-#{n}\r\n- アイデアその2-#{n}\r\n- アイデアその3-#{n}\r\n - 先生のコメント\r\n > 絵を描いたほうがいい\r\n\r\n## TODO\r\n- 事務処理-#{n}\r\n- 研究相談-#{n}\r\n\r\n## DONE\r\n- プロトタイプ作成-#{n}\r\n"
    @user.memos.create(text: text, date: date)
  end

  #ESテスト用ダミーデータ
  @user.memos.create!([
    {
      text: "# 就活", date: 15.day.ago
    },
    {
      text: "# 就活その2", date: 16.day.ago
    },
    {
      text: "# サークル \r\n## アカペラ \r\nがんばる", date: 17.day.ago
    },
    {
      text: "# ビール　\r\n## 香るプレミアム \r\nおいしい", date: 18.day.ago
    },
    {
      text: "# あつい漫画 \r\n- ぐらんぶる \r\n- 監獄学園 \r\n- おじさんとマシュマロ", date: 19.day.ago
    }
  ])
end