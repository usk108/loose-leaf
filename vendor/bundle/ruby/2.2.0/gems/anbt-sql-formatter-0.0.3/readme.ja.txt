= anbt-sql-formatter

(C) 2010 sonota <yosiot8753@gmail.com>


== 概要

Java製の SQL整形ツール BlancoSqlFormatter

blancoSqlFormatter - SQL整形ライブラリ
http://www.igapyon.jp/blanco/blancosqlformatter.html

を Ruby に移植したものです。
完全な移植を目指したものではなく、改造が加わっています。


== インストール

 $ ruby setup.rb


== 使い方

標準入力で SQL を渡します。

 $ echo "select a,b from c;" | anbt-sql-formatter
 SELECT
         a
         , b
     FROM
         c
 ;
 $

後は適宜 Emacs などエディタと連携させたりして使ってください。


== ライセンス

GNU Lesser General Public License.


== 著者

sonota:: Ruby へ移植

次はオリジナルの Java版のクレジットの写しです。

渡辺義則 / Yoshinori WATANABE / A-san:: 初期バージョンの開発
伊賀敏樹 (Tosiki Iga / いがぴょん):: 維持メンテ担当


== Java版からの変更点覚書

=== 全般

* 名前空間 AnbtSql を導入。また、ファイル名を
  AnbtSqlFormatter.java → formatter.rb
  といったように変更。

=== formatter.rb / coarse-tokenizer.rb

* #format_list から #format_list_main_loop などを分離した。
* 粗トーカナイズ処理を coarse-tokenizer.rb に分離。
  おそらく Java版からの一番大きな変更。
  本質的に SQL とは関係の薄い文字列とコメントのトーカナイズだけを別に行う。


== その他の変更点

* フロントエンドのサンプル追加。
* テストを追加（特に単体テスト）。


== 処理の概要

1. AnbtSql::Parser
   1. 粗トークン（文字列、コメント、それ以外）に分割
   2. トークンに分割
2. AnbtSql::Formatter
   1. トークンのリストを元にインデント等を整形


== カスタマイズ

* formatter に与える rule に追加
  * 関数として扱うキーワードの追加
  * 特定の改行・インデンテーション規則に対応するキーワードを追加
  * インデントに用いる文字を指定
  * キーワードの大文字・小文字指定
* もっと細かくカスタマイズしたい場合は
  AnbtSql::Formatter#format_list_main_loop を
  継承、またはモンキーパッチング等で修正（オーバーライド）してください。


== テスト

 $ ruby setup.rb test


== その他

* 一行コメントの次でインデントが乱れる点が修正候補となっていたため
  修正した。
  AnbtSql::Formatter#format_list_main_loop 内で対処したが、
  やっていることは末尾の改行を削っているだけなので
  もっと前のトークン分割時に対処した方が良いかも。
