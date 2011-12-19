class CreateStatusPresences < ActiveRecord::Migration
  def self.up
    create_table :status_presences do |t|
      t.string :name
      t.string :abbreviation
      t.timestamps
    end
  end

  def self.down
    drop_table :status_presences
  end
end
