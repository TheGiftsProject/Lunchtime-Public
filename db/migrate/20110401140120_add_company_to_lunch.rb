class AddCompanyToLunch < ActiveRecord::Migration
  def self.up
    add_column :lunches, :company_id, :integer
  end

  def self.down
    remove_column :lunches, :company_id
  end
end
