class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: %i(create new)
  before_action :set_prototype, only: %i(show edit update destroy)

  def index
    @prototypes = Prototype.includes(:user, :main_image).order('likes_count DESC').page(params[:page])
    @active = 'popular'
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show
    @sub_images = @prototype.images.sub
    @user = @prototype.user
    @like = @prototype.likes.find_by(user_id: @user.id, prototype_id: params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def create
    prototype = current_user.prototypes.new(prototype_params)
    if prototype.save
      redirect_to root_path, success: 'Your prototype was successfully posted'
    else
      render ({ action: :new }), warning: 'Failed'
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
      render ({ action: :edit }), warning: 'Your prototype was not updated'
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path, success: 'Your prototype was successfully deleted'
    else
      redirect_to ({ action: :show }), warning: 'Your prototype was not deleted'
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
