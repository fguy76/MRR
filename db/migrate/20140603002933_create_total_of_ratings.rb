class CreateTotalOfRatings < ActiveRecord::Migration
  def self.up
    create_table :total_of_ratings do |t|
      t.belongs_to :rateable, :polymorphic => true       
      t.integer :rater_id
      t.integer :rateable_id
      t.string  :rateable_type
      t.integer :total_of_rating 
      t.timestamps
    end

    add_index :total_of_ratings, :rater_id
    add_index :total_of_ratings, [:rateable_id, :rateable_type]
  end

  def self.down
      drop_table :total_of_ratings
  end
end
