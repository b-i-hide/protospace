class LikesController < ApplicationController

  after_action :set_prototype, only: %i(create destroy)
  before_action :set_likes, only: %i(create destroy)

  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def set_likes
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

end
