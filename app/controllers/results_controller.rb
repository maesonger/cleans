class ResultsController < ApplicationController
  def show
    #@companies = CleanCompany.joins(:clean_prefectures).where(prefecture_id: params[:prefecture_id]).select("clean_prefectures.clean_company_id, clean_prefectures.prefecture_id")
    company_ids = CleanPrefecture.where(prefecture_id: params[:prefecture_id]).pluck(:clean_company_id)
    @companies = CleanCompany.where(id: company_ids)
    
    #binding.pry
  end
end


