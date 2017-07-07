class CleanCompaniesController < ApplicationController

  def index
    @companies = CleanCompany.all
  end
  
  def show
    @company = CleanCompany.find(params[:id])
  end

end