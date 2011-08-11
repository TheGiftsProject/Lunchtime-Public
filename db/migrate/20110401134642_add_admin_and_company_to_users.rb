class AddAdminAndCompanyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
    add_column :users, :company_id, :integer
  end

  def self.down
    remove_column :users, :company_id
    remove_column :users, :admin
  end
end
