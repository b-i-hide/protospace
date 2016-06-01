class PrototypesController < ApplicationController

  before_action :authenticate_user!
  def index

  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show

  end

  def create
    if current_user.prototypes.create(prototype_params)
      flash[:success] = 'Your prototype was successfully posted'
      redirect_to action: :index
    else
      flash[:warning] = 'Failed'
      redirect_to action: :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, images_attributes: [:status, :image])
  end
end
