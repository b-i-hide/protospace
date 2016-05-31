class PrototypesController < ApplicationController

  def index

  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def show

  end

  def create
    Prototype.create(prototype_params)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:name, :concept, :chatch_copy, images_attribute: [:id, :prototype_id, :status, :image]).merge(user_id: current_user.id)
  end
end
