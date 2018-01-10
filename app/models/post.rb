class Post < ApplicationRecord
  include SearchCop

  validates :title, presence: true
  belongs_to :user
  belongs_to :category
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :comments, dependent: :destroy

  search_scope :search do
    attributes :title
    attributes comment: 'comments.content'
  end

  acts_as_taggable
  ratyrate_rateable 'content'

end
