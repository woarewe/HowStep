class StepsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @step = @post.steps.create steps_params

    redirect_to edit_post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])
  end

  def destroy
  end

  def update
    redirect_to root_path
  end

  private

  def steps_params
    params.require(:step).permit(:title)
  end
end
