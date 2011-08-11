class CreateRestaurantsToTags < ActiveRecord::Migration
  def self.up
    create_table :restaurants_to_tags do |t|
      t.references :restaurant
      t.references :tag

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants_to_tags
  end
end
