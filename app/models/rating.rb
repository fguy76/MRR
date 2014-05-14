class Rating < ActiveRecord::Base
  attr_accessible :value

    belongs_to :movie
    belongs_to :user

end
