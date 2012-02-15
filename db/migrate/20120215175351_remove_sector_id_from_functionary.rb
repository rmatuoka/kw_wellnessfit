class RemoveSectorIdFromFunctionary < ActiveRecord::Migration
  def self.up
    remove_column :functionaries, :sector_id
  end

  def self.down
    add_column :functionaries, :sector_id, :integer
  end
end
