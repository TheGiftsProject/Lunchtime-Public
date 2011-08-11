class CreateCompaniesRestaurantsTable < ActiveRecord::Migration
  def self.up
    create_table :companies_restaurants, :id => false  do |t|
      t.integer :company_id
      t.integer :restaurant_id
    end
  end

  def self.down
    drop_table :companies_restaurants
  end
end
