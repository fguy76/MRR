class AddMovieRatingTotalToTotalRatings < ActiveRecord::Migration

  def self.up

    add_column :total_ratings, :movie_rating_total, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :total_ratings, :movie_rating_total

  end

end
