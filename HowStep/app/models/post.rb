class Post < ApplicationRecord
  belongs_to :user
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_taggable
  ratyrate_rateable 'content'

end
