class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: %i(create new)
  before_action :set_prototype, only: %i(show edit update destroy)

  def index
    @prototypes = Prototype.includes(:user, :main_image).page(params[:page])
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
    @sub_images = @prototype.images.sub
    @user = @prototype.user
  end

  def create
    prototype = current_user.prototypes.new(prototype_params)
    if prototype.save
      redirect_to ({ action: :index }), success: 'Your prototype was successfully posted'
    else
      flash[:warning] = 'Failed'
      render action: :new
    end
  end

  def edit
    @main_image = @prototype.main_image
    @sub_images = @prototype.sub_image_fields
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to ({ action: :show }), success: 'Your prototype was successfully updated'
    else
      flash[:warning] = 'Your prototype was not updated'
      render action: :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to ({ action: :index }), success: 'Your prototype was successfully deleted'
    else
      flash[:warning] = 'Your prototype was not deleted'
      redirect_to action: :show
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, images_attributes: [:id, :status, :image])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
