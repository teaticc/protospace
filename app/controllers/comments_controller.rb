class CommentsController < ApplicationController
  include Common
  before_action :set_prototype, only: :create
  before_action :return_sign_out_user, only: :create

  def create
    @prototype.comments.create(comment_params)
    @comments = Comment.where(prototype_id: params[:prototype_id]).includes(:user)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
