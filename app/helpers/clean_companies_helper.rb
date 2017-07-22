module CleanCompaniesHelper
  def gravatar_url(clean_company, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(clean_company.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
  
  def get_back
    if current_user.is_hotel
      link_to '<一覧に戻る', clean_companies_path, class: 'btn btn-default'
    elsif current_user.is_clean_company
      link_to '<一覧に戻る', user_path(current_user.id), class: 'btn btn-default'
    end
  end

  # おすすめ
  # is_xxx?
  def is_thread?
    if CleanThread.find_by(clean_company_id: params[:id]) && CleanThread.find_by(user_id: current_user.id)
      true
    else
      false
    end
  end
end
