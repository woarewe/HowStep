class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Post"
  belongs_to :rateable, :polymorphic => true
end
