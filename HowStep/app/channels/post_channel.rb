class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comments'
  end
end