class CommentsController < ApplicationController

  def create
    # binding.pry
    # user = User.create(username:params[:comment][:user_attributes][:username]) unless params[:comment][:user_attributes][:username] == ''
    comment = Comment.create(comment_params)
    # comment.update(user_id:user.id) unless user == nil
    redirect_to comment.post
  end

  private 
  def comment_params
  # params.require(:comment).permit(:content, :post_id, :user_id)
  params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
