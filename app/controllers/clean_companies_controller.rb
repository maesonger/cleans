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
  end
  
  def create
    
    @company = CleanCompany.new(user_id: params[:user_id],
                                name: params[:clean_company][:name],
                                image_url: params[:clean_company][:image_url],
                                tel: params[:clean_company][:tel],
                                email: params[:clean_company][:email])
    
    #binding.pry
    
    if @company.save
      flash[:success] = '会社を登録いたしました。'
      redirect_to new_clean_company_clean_prefecture_path(@company)
    else
      flash.now[:danger] = '会社の登録に失敗しました。'
      render :new and return
    end

  end
  
  def destroy
    CleanCompany.find(params[:id]).destroy
    flash[:success] = "Company deleted"
    redirect_to user_path(current_user.id)
  end
  
  def edit
    @company = CleanCompany.find(params[:id])
  end
  
  def update
    @company = CleanCompany.find(params[:id])
    #binding.pry
    if @company.update(name: params[:clean_company][:name],
                      image_url: params[:clean_company][:image_url],
                      tel: params[:clean_company][:tel],
                      email: params[:clean_company][:email])
       #binding.pry
       redirect_to clean_company_path(@company)
    else
      render :edit
    end
  end

  private
  
  # Strong Parameter

  def clean_company_params
    params.require(:clean_company).permit(:name, :tel, :email)
  end

end