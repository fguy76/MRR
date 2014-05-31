class TotalRating < ActiveRecord::Base
  # attr_accessible :title, :body

   has_many :rates, :column_name => 'total_ratings', :delta_column => 'stars'
end
