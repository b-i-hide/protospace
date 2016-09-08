class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user, only: %i(show update edit)

  def show
    @prototypes = @user.prototypes.page(params[:page]).per(8)
    @prototypes_count = @user.prototypes
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:success] = 'Your data was successfully updated'
    redirect_to action: :show
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile, :works, :email, :password, :group, :avatar)
  end
end
