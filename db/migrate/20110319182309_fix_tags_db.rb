class FixTagsDb < ActiveRecord::Migration
  def self.up
    drop_table :restaurants_to_tags
    
    create_table :restaurants_tags, :id => false do |t|
      t.integer :restaurant_id
      t.integer :tag_id
    end
    
  end

  def self.down
    drop_table :restaurants_tags
    
    create_table :restaurants_to_tags do |t|
      t.references :restaurant
      t.references :tag

      t.timestamps
    end
  end
end
