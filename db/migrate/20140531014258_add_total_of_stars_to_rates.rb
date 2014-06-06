class AddTotalOfStarsToRates < ActiveRecord::Migration
  def change
    add_column :rates, :total_of_stars, :float
  end
end
