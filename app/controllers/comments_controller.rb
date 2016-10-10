class CommentsController < ApplicationController

  def create
    # binding.pry
    @comment = Comment.create(comment_params)
    @comment.post_id = params["post_id"]
    if params["comment_user_attributes_username"].present?
      @user = User.find_or_create_by(username: params[:comment_user_attributes_username])
      @comment.user = @user
    end
    @comment.save
    @post = Post.find_by_id(params["post_id"])
    @post.comments << @comment
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
