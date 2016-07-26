class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge({user_id: current_user.id, prototype_id: params[:prototype_id]})
  end
end
