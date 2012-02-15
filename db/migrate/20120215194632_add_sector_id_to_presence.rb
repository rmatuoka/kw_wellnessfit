class AddSectorIdToPresence < ActiveRecord::Migration
  def self.up
    add_column :presences, :sector_id, :integer
  end

  def self.down
    remove_column :presences, :sector_id
  end
end
