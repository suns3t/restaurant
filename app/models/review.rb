class Review < ApplicationRecord
  belongs_to :food_item
  
  validates :score, :comment, presence: true
end
