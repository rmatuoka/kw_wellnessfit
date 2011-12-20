class AddCompanyIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :company_id, :integer
  end

  def self.down
    remove_column :events, :company_id
  end
end
