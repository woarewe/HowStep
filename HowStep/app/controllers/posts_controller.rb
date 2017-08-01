class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    render 'posts/new'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title)
  end

end
