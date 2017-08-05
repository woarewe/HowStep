class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit { CommentBroadcastJob.perform_now self}
end
