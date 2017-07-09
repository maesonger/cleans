class ContactController < ApplicationController
  def index
    @company = CleanCompany.find(params[:clean_company_id])
  end
end
