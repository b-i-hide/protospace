class PrototypesController < ApplicationController

  before_create :authenticate_user!
  def index

  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show

  end

  def create
    if Prototype.create(prototype_params)
      flash[:success] = 'Your prototype was successfully posted'
      redirect_to action: :index
    else
      flash[:warning] = 'Failed'
      redirect_to action: :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, images_attributes: [:id, :prototype_id, :status, :image]).merge(user_id: current_user.id)
  end
end
