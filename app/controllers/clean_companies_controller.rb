class CleanCompaniesController < ApplicationController

  def index
    @companies = CleanCompany.all
  end

end