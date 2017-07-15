module CleanCompaniesHelper
  def gravatar_url(clean_company, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(clean_company.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
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
