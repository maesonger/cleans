class CleanDetailsController < ApplicationController
  def new
    @prefecture = CleanPrefecture.new
    @charge = Charge.new
  end
end
