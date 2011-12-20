class CreateEventsSectors < ActiveRecord::Migration
  def self.up
    create_table :events_sectors, :id => false do |t|
        t.integer :event_id
        t.integer :sector_id 
        t.timestamps
    end
  end

  def self.down
    drop_table :events_sectors
  end
end
