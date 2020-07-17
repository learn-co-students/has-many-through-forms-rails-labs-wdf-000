class CommentsController < ApplicationController

  def create
    if params[:comment][:user_attributes][:username].empty?
      params[:comment].delete(:user_attributes)
    end
    comment = Comment.create(comment_params)
    redirect_to post_path(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
