class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    @user.update(update_params)
    redirect_to action: :show
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:name, :profile, :works)
  end
end
