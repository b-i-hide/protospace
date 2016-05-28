class UsersController < ApplicationController
  before_action :set_user, only: %i(show update edit)

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:success] = '編集に成功しました'
    redirect_to action: :show
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile, :works, :email, :password, :group)
  end
end
