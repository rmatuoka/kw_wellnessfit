class CreateFunctionaries < ActiveRecord::Migration
  def self.up
    create_table :functionaries do |t|
      t.integer :company_id
      t.integer :sector_id
      t.string :name
      t.string :internal_code
      t.boolean :active
      t.date :inactivation_date
      t.text :reason
      t.boolean :sex
      t.timestamps
    end
  end

  def self.down
    drop_table :functionaries
  end
end
