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
    @prefecture = CleanPrefecture.new
    @charge = Charge.new
  end
  
  def create
    
    #binding.pry
    
    @company = CleanCompany.new(
      user_id: params[:user_id],
      name: params[:name],
      tel: params[:tel],
      email: params[:email]
    )

    if @company.save
    else
      flash.now[:danger] = '会社の登録に失敗しました。'
      render :new and return
    end

    if params[:prefecture_id].nil?
      flash.now[:danger] = '作業可能地域が入力されていません。'
      render :new and return
    end

    params[:prefecture_id].each do |p| 
    
      @prefecture = CleanPrefecture.new(
        clean_company_id: @company.id,
        prefecture_id: p.to_i
      )
      #binding.pry
      if @prefecture.save
      else
        flash.now[:danger] = '作業地域の登録に失敗しました。'
      end
      
    end

    params[:square_meters_min].each_with_index do |meter, i| 
      if !params[:square_meters_min][i].blank?
        @charge = Charge.new(
          clean_company_id: @company.id,
          square_meters_min: params[:square_meters_min][i],
          square_meters_max: params[:square_meters_max][i],
          charge: params[:charge][i]
        )
        if @charge.save
        else
          flash.now[:danger] = '料金の登録に失敗しました。'
        end
      end
    end

    # if @charge.save
      flash[:success] = '会社を登録いたしました。'
      redirect_to clean_company_path(@company)
    # end 

  end

  private
  
  # Strong Parameter
=begin
  def clean_company_params
    params.require(:clean_company).permit(:name, :tel, :email)
  end
=end
end