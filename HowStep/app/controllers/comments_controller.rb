class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def comment_data_hash comment
    {comment: comment.content, image: comment.user.image, user: user_path(comment.user)}
  end
end
