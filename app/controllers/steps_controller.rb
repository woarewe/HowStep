class StepsController < ApplicationController
  before_action :set_post

  def create
    @step = @post.steps.create step_params
    redirect_to edit_post_path(@post)
  end

  def edit
    @step = @post.steps.find(params[:id])
  end

  def destroy
    @step = Step.find(params[:id]).destroy
    flash[:notice] = t('controllers.steps.destroy.notice')
    redirect_to edit_post_path(@post)
  end

  def update
    @step = @post.steps.find(params[:id])
    if @step.update(title: params[:title], content: params[:content])
      flash[:notice] = 'All is good'
    end
  end

  private

  def step_params
    params.require(:step).permit(:title)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
