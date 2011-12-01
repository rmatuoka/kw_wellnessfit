class CreateBouts < ActiveRecord::Migration
  def self.up
    create_table :bouts do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :bouts
  end
end
