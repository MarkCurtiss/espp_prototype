class Espp < ActiveRecord::Migration
  def self.up
    change_table :espps do |t|
      t.rename(:calculation, :contribution)
    end
  end

  def self.down
    change_table :espps do |t|
      t.rename(:contribution, :calculation)
    end
  end
end
