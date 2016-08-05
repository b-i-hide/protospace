class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @prototype = Prototype.tagged_with(@tag.name)
  end
end
