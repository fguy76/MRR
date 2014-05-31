class CreateTotalRatings < ActiveRecord::Migration
  def change
    create_table :total_ratings do |t|

      t.timestamps
    end
  end
end
