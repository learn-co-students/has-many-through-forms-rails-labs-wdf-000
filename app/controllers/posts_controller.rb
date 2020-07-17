class PostsController < ApplicationController
  def show
    # binding.pry
    @post = Post.find(params[:id])
    # @categories = @post.categories
    # @users = @post.users
    @comment = Comment.new
    # @user = User.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # @post.categories.build
  end

  def create
    post = Post.create(post_params)
    # binding.pry
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
