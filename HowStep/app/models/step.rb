class Step < ApplicationRecord
  belongs_to :post
  acts_as_list scope: :post
end
