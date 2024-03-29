class CreateBoutFunctionaries < ActiveRecord::Migration
  def self.up
    create_table :bout_functionaries do |t|
      t.integer :functionary_id
      t.integer :bout_id
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :bout_functionaries
  end
end
