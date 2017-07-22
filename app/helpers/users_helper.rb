module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
  
  def get_back_top
    link_to '<トップに戻る', root_path, class: 'btn btn-default'
  end
end
