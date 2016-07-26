class CommentsController < ApplicationController
  def create
    Comment.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def destroy
    Comment = Comment.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    comment.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end
