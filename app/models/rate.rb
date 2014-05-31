class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true

  belongs_to :total_rating
  counter_culture :total_rating

  #attr_accessible :rate, :dimension

end