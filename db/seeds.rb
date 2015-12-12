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
  113.times do |n|
    date  = (n+1).day.ago
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
    memo = @user.memos.create(text: text, date: date)
    memo.update_headlines
    memo.update_pieces
  end

  #ESテスト用ダミーデータ
  @user.memos.create!([
    {
      text: "# 就活\r\n- 自己紹介を考える\r\n- なんかこう、前向きなやつ\r\n", date: 115.day.ago
    },
    {
      text: "# 就活\r\n- 自己分析をそろそろしましょう\r\n- 研究のお話を練習\r\n# 研究室\r\n- イノベーターワークショップ報告done\r\n- WIT報告done\r\n- 次の学会決める\r\n", date: 116.day.ago
    },
    {
      text: "# サークル \r\n## アカペラ \r\nがんばる", date: 117.day.ago
    },
    {
      text: "# ビール　\r\n## 香るプレミアム \r\nおいしい", date: 118.day.ago
    },
    {
      text: "# あつい漫画 \r\n- ぐらんぶる \r\n- 監獄学園 \r\n- おじさんとマシュマロ", date: 119.day.ago
    }
  ])
end