class CleanCompaniesController < ApplicationController
  
  def index
    @companies = CleanCompany.all
  end
  
  def show
    @company = CleanCompany.find(params[:id])
    @threads = @company.clean_threads
    @thread = CleanThread.find_by(clean_company_id: params[:id]) && CleanThread.find_by(user_id: current_user.id)
  end
  
  def new
    @company = CleanCompany.new
    @charge = Charge.new
  end
  
  def create
    @company = CleanCompany.new(
      user_id: params[:user_id],
      name: params[:clean_company][:name],
      tel: params[:clean_company][:tel],
      email: params[:clean_company][:email]
    )
    
=begin
    @company = CleanCompany.new(user_id: params[:user_id])
    
    @company = CleanCompany.new(clean_company_params)
=end    
    if @company.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @company
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
  end
  
  
  private
  
  # Strong Parameter
  def clean_company_params
    params.require(:clean_company).permit(:name, :tel, :email)
  end

end