class CreateLunches < ActiveRecord::Migration
  def self.up
    create_table :lunches do |t|
      t.string :state
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :lunches
  end
end
