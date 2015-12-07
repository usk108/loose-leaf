module ApplicationHelper
  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true

  def markdown(text)
    @@markdown.render(text).html_safe
  end

  # 現在表示しているドキュメントのfrom値を表示
  # ※文字列を指定されるとうまくいかないかもしれない
  def current_document
    (params.fetch(:page, 1).to_i - 1) * params.fetch(:per, 0).to_i 
  end

  # ページ表示件数のリンクを返す
  def per_page_links
    # 表示件数の初期値の設定
    current = query_string(params).fetch(:per, ::Memo::PER_PAGES.first).to_i

    # aタグの作成
    ::Memo::PER_PAGES.map do |per_page|
      if current == per_page
        per_page
      else
        link_to(per_page, "?#{query_string(params).merge(per: per_page).to_query}")
      end
    end.join(' | ').html_safe
  end

  # クエリストリングを作成
  # 表示件数やソート順などのリンクを押した時にqやclosedなどのパラメータは設定したままにする
  # pageは設定しないのでページは0ページ目ににクリアされる
  #   params - paramsオブジェクト
  def query_string(params)
    params.slice(:q, :per)
  end
end
