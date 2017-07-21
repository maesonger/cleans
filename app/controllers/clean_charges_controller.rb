class CleanChargesController < ApplicationController
  def new
    @charge = Charge.new
  end
  
  def create
    @charge = Charge.new
    params[:square_meters_min].each_with_index do |meter, i|
      
      if !params[:square_meters_min][i].blank?
        @charge = Charge.new(
          clean_company_id: params[:clean_company_id],
          square_meters_min: params[:square_meters_min][i],
          square_meters_max: params[:square_meters_max][i],
          charge: params[:charge][i]
        )
        if @charge.save
          flash.now[:danger] = '会社を登録しました。'
          redirect_to clean_company_path(params[:clean_company_id]) and return
        else
          flash.now[:danger] = '料金の登録に失敗しました。'
          render:new and return
        end
        
      else
        flash.now[:danger] = '料金の登録に失敗しました。'
        render:new and return
      end
    end
  end
end
