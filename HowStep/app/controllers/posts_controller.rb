class PostsController < ApplicationController
  before_action :set_post, except: [:index, :create, :new]

  def index
    if(params[:tag])
      @posts = Post.tagged_with(params[:tag])
    else
     @posts = Post.all
    end
  end

  def show
    @steps = @post.steps.paginate(page: params[:page], per_page: 1)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    render 'posts/new'
  end

  def edit
    @step = Step.new
    @steps = @post.steps
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
    @step = Step.new
    check_update(@post)
    render 'edit'
  end

  private

  def post_params
    params.require(:post).permit(:title, :tag_list)
  end

  def check_update(post)
    if post.update_attributes(post_params)
      flash.now[:notice] = t('controllers.posts.update.notice')
    else
      flash.now[:alert] = t('controllers.posts.update.alert')
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
