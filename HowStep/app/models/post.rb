class Post < ApplicationRecord
  belongs_to :user
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
end
