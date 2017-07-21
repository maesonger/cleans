module CleanReviewsHelper
  def gravatar_url(clean_company, options = { size: 30 })
    gravatar_id = Digest::MD5::hexdigest(clean_company.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
end
