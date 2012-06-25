class CreateEspps < ActiveRecord::Migration
  def self.up
    create_table :espps do |t|
      t.primary_key :id
      t.float :calculation
      t.float :discount

      t.timestamps
    end
  end

  def self.down
    drop_table :espps
  end
end
