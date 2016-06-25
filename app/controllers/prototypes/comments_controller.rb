class Prototypes::CommentsController < ApplicationController

  before_action :set_prototype, only: %i(create)

  def create
    @comment = @prototype.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :prototype_id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

end
