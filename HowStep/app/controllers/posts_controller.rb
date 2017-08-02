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
    @post = current_user.posts.create(post_params)
    redirect_to action: 'edit', id: @post.id
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = t('controllers.posts.destroy.notice')
    redirect_to root_path
  end

  def update
    @post = Post.find(params[:id])
    check_update(@post)
    render 'edit'
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end

  def check_update(post)
    if post.update_attributes(post_params)
      flash.now[:notice] = t('controllers.posts.update.notice')
    else
      flash.now[:alert] = t('controllers.posts.update.alert')
    end
  end
end
