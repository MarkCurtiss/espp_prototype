class AddPricesToEspp < ActiveRecord::Migration
  def self.up
    add_column :espps, :starting_price, :float
    add_column :espps, :closing_price, :float
  end

  def self.down
    remove_column :espps, :closing_price
    remove_column :espps, :starting_price
  end
end
