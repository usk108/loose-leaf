= anbt-sql-formatter

(C) 2010 sonota (yosiot8753@gmail.com)


== Description

A tool for SQL formatting ported from 
{BlancoSqlFormatter}[http://sourceforge.jp/projects/blancofw/releases/?package_id=4732].


== Install

 $ ruby setup.rb


== Usage

 $ echo "select a,b from c;" | anbt-sql-formatter
 SELECT
         a
         , b
     FROM
         c
 ;
 $


== License

GNU Lesser General Public License.


== Authors

sonota:: Porting to Ruby

Following are Authors of BlancoSqlFormatter(original Java version).

渡辺義則 / Yoshinori WATANABE / A-san:: Early development
伊賀敏樹 (Tosiki Iga / いがぴょん):: Maintainance


== Customize

* In AnbtSql::Rule:
  * Function names
  * Rules for linefeed and indentation
  * Characters for indentation
  * Upcase or Downcase
* More farther: 
  Override AnbtSql::Formatter#format_list_main_loop
  by inheritance or monkeypathcing.


== Test

 $ ruby setup.rb test
