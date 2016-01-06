# Loose Leaf

Loose Leafはメモ統合管理Webアプリです。
現在も開発途中のものになります。

## Features

### あらゆる形式のメモに同期
いろんな場所にいろんな形式のメモが散在していませんか？
LooseLeafならアプリ上での独自のメモ管理の他、Evernote、kobito、Dropbox上の全てのメモと同期し、一括管理することができます。

### 興味のある文章だけを一覧的に表示
「大量のドキュメントの中から例のプロジェクトに関する情報だけを見たい…」
LooseLeafなら全てのメモの中から特定のトピックに関する文章のみを抽出し、一覧的な表示が可能です。
文章の抽出は見出しや見出しに付与されたタグによって行われます。

### 「情報」をブックマーク
気になるトピックに関するメモの文章の検索結果はブックマーク登録できます。
元テキストファイルを変更することなく、必要な情報だけをまとめたブックマークで大量のメモを便利に管理しましょう。

## Current State

- LooseLeaf上での独自のメモ管理機能の実装
- 検索機能の実装
- 情報ブックマーク機能の実装

## 実現したい哲学
「自分の書いたメモはどこに保存されていようと全て一箇所で管理できるべきだ」

## 要件
- ユーザー管理
- メモの作成・編集・削除
- 外部メモのインポート・編集・変更内容反映
    - ローカルのテキストファイル（.txt）
    - evernote
    - kobito
- 検索機能
    - キーワードが含まれるメモの全体の表示
    - 一覧性は低いが全てのメモから情報を探すことができる
- 情報抽出機能
    - キーワードに関する部分のみを抽出し、一枚のページとして表示できる
    - キーワードに関する部分
        - 見出し
        - タグ

## 仕様
[w]は余裕があれば付けたい機能

### ユーザー管理
- メールとパスワードでログイン
- ログインすると自分のメモだけを閲覧・編集することができる
- [w]Googleアカウントとひもづけ
- 関連gem
    - devise


### Lメモの作成・編集・削除
- LooseLeaf独自のメモをLメモと呼ぶこととする
    - 将来的に外部メモ（evernoteなど）をLメモの形で管理することを想定（未実装）
- Lメモはmarkdownで記述する
- [w]KobitoやMarxicoみたいな感じで記述できるエディタにしたい
- 関連gem
    - redcarpet


### 一覧表示機能
- １４日分のメモが表示される
- １つのメモ表示エリアには編集，削除ボタンが設置されている
- 関連gem
    - kaminari

### 外部メモのインポート・編集・変更内容反映（未実装）
- Dropbox上のテキストファイル（.txt，.md）
- evernote
- kobito

### 検索機能（未実装）
- キーワードが含まれるメモの集合を全て表示
    - 該当部分を含む部分的な表示をする
        - （ここが難しそう）
    - キーワードの部分はハイライトされる
    - markdownで書かれていなくても使える機能

### 情報抽出機能
- キーワードに関する部分のみを抽出し、一枚のページとして表示できる機能
    - メモがmarkdownで書かれていることが前提の機能
- 抽出の際の切り分け単位
    - 見出し
        - キーワードを含む見出しに対して，それの以下に存在するDOMを抽出
        - それを全ての日程のメモに対して行う
    - タグ（未実装）
        - 見出しに対してタグを付与することができる
        - タグを持った見出し以下のDOMを抽出
- elastic searchを使って全メモを検索する
    - 現在のデータ量で必須かと言われると怪しいが，後学のためやってみる
- 関連gem
    - elasticsearch
    - elasticsearch-dsl
    - elasticsearch-model
    - elasticsearch-rails

### バインド機能
- 情報抽出機能の結果を保存しておくことができる
    - 毎回検索すると以下のデメリットが有る
        - 検索＋情報抽出をするためメモが増えていくと時間がかかってしまう
        - 検索のために文字を打つのがめんどくさい
        - 前回どんなキーワードで検索したのか忘れてしまう


### モデル実装

#### User model
ユーザーのモデル

```ruby:user.rb
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
has_many :memos
has_many :binders
has_many :headlines
```


#### Memo model
メモのモデル

```ruby:memo.rb
# Table name: memos
#
#  id         :integer          not null, primary key
#  date       :datetime
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
belongs_to :user
has_many :headline_memos
has_many :headlines
has_many :pieces
```

#### Binder model
バインダーのモデル

```ruby:binder.rb
# Table name: binders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not nullhas_many :pieces
has_one :headline
belongs_to :user
```

#### Piece model
- メモの文章から見出しに紐付けられて抽出された部分集合

```ruby:piece.rb
# Table name: pieces
#
#  id          :integer          not null, primary key
#  html        :text(65535)
#  date        :string(255)
#  binder_id   :integer
#  memo_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  headline_id :integer
#
belongs_to :binder
belongs_to :memo
belongs_to :headline
```

#### Headline model
ユーザー持っている見出し
  - 見出しに応じたバインダーが存在するとは限らない

```ruby:headline.rb
# Table name: headlines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  binder_id  :integer
#
belongs_to :user
belongs_to :binder
has_many :headline_memos
has_many :memos, through: :headline_memos
has_many :pieces
```



## Environment

- ruby 2.2.3

- Ruby on Rails 4.2.4

- elastic search 1.7.3

- jdk 1.8.0_65



<!-- # Loose Leaf

Loose Leaf is an Web application managing daily memos like loose-leaf.

Now, this application is under construction.

## Features

### Uniform management of memos

You can uniformly manage memos on not only LooseLeaf but also Evernote, Kobito and Dropbox.

### Access information on various memos

LooseLeaf can extract sentences ralative to what you are interested in and display them at sight.

## Environment

- ruby 2.2.3

- rails 4.2.4

- elastic search 1.7.3

- jdk 1.8.0_65

## Usage on local

### setup elasticsearch

```
$ elasticsearch
```
 -->
