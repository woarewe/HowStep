class StepsController < ApplicationController
  respond_to :js, :html, :json

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
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])

    respond_to do |format|
      if @step.update(content: params[:content], title: params[:title])
        format.html { redirect_to edit_post_step_path(@post, @step), notice: 'All good!'}
        format.js
        format.json { render json: @step, status: :created, location: @step }
      end
    end
  end

  private

  def steps_params
    params.require(:step).permit(:title)
  end
end
