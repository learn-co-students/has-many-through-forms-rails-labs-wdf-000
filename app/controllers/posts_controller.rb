class PostsController < ApplicationController
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if params["categories_attributes"].present?
      params["categories_attributes"].each do |category|
        @category = Category.create(name: category)
        post.categories << @category
      end
    end
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], comment_content: [:content], categories_attributes:[])
  end

end
