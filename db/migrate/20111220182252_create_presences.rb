class CreatePresences < ActiveRecord::Migration
  def self.up
    create_table :presences do |t|
      t.integer :functionary_id
      t.integer :event_id
      t.integer :status_presence_id
      t.timestamps
    end
  end

  def self.down
    drop_table :presences
  end
end
