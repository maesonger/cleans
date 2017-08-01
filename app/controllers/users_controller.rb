class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @companies = @user.clean_companies
  end

  def new
    @user = User.new
  end

  def create
    
    if env['omniauth.auth'].present?
      # Facebookログイン
      @user  = User.from_omniauth(env['omniauth.auth'])
      result = @user.save(context: :facebook_login)
      fb       = "Facebook"
    else
      # 通常サインアップ
      @user  = User.new(strong_params)
      result = @user.save
      fb       = ""
    end
    
    binding.pry
    if result
      sign_in @user
      flash[:success] = "#{fb}ログインしました。" 
      redirect_to @user
    else
      if fb.present?
          redirect_to auth_failure_path
      else
          render 'new'
      end
    end
    
=begin
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
=end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:name],
                    account_type: params[:account_type],
                    email: params[:email],
                    tel: params[:tel],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
       redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :account_type, :email, :tel, :password, :password_confirmation)
  end
end
