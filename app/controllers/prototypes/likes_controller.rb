class LikesController < ApplicationController

  before_action :set_prototype, only: %i(create destroy)

  def create
    @like = @prototype.likes.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    like = @prototype.likes.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

end
