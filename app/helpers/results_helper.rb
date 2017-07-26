module ResultsHelper
  def reference_back
    link_to '<一覧に戻る', clean_companies_search_path, class: 'btn btn-default'
  end
end
