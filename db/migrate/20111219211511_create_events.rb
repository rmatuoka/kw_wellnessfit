class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :bout_id
      t.date :event_date
      t.integer :employees_present
      t.text :observation
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
