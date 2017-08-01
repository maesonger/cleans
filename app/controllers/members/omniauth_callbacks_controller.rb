class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  
  def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end
  
  
  
  def failure
    redirect_to root_path
  end
  
  private
  
  
  def callback_from(provider)
    #binding.pry
    provider = provider.to_s

    @member = Member.find_for_oauth(request.env['omniauth.auth'])

    if @member.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @member, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_member_registration_url
    end
  end
end