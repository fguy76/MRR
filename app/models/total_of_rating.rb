class TotalOfRating < ActiveRecord::Base
  attr_accessible :total_of_rating
  
  belongs_to :rateable, :polymorphic => true
  # has_many :rates as: :rateable
end
