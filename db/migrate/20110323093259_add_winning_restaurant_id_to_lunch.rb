class AddWinningRestaurantIdToLunch < ActiveRecord::Migration
  def self.up
    add_column :lunches, :winning_restaurant_id, :integer
  end

  def self.down
    remove_column :lunches, :winning_restaurant_id
  end
end
