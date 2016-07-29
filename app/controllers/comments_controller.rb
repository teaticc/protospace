class CommentsController < ApplicationController
  include Common
  before_action :set_prototype, only: :create
  def create
    @prototype.comments.create(comment_params)
    # N+1問題発生中（includesしても無理）
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
