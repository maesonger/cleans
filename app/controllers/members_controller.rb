class MembersController < ApplicationController
  before_action :set_member, only: [ :update, :destroy ]

  def edit
  end

  def update
    if @member.update( member_params )
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @member.destroy
      redirect_to root_path
      else
      render :edit
    end
  end

  private
  def set_user
    @member = Member.find( params[:id] )
  end

  def user_params
    params.require(:member).permit( :name )
  end
end
