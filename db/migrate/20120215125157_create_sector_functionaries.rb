class CreateSectorFunctionaries < ActiveRecord::Migration
  def self.up
    create_table :sector_functionaries do |t|
      t.integer :functionary_id
      t.integer :sector_id
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :sector_functionaries
  end
end
