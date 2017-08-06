class Step < ApplicationRecord
  belongs_to :post
  acts_as_list scope: :post


  def get_content
    unless self.content.nil?
      self.content.split('=~@~=').map { |unit| '<div class="unit">' + unit + '</div>' }.join
    else ''
      end
  end
end
