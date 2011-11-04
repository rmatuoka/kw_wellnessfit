class CreateSectors < ActiveRecord::Migration
  def self.up
    create_table :sectors do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :sectors
  end
end
