class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :company_name
      t.string :fantasy_name
      t.string :cnpj
      t.string :phone
      t.string :address
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :responsible
      t.string :segment
      t.date :date_visit
      t.string :email
      t.string :electronic_address
      t.string :doctor
      t.string :nurse
      t.string :security
      t.string :engineering
      t.string :rh_responsible
      t.string :rh_contact
      t.boolean :gymnastics
      t.text :reason_gymnastics
      t.text :quality
      t.text :map
      t.text :absenteeism
      t.text :rotation
      t.integer :male_workers
      t.integer :female_workers
      t.text :agreement
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
