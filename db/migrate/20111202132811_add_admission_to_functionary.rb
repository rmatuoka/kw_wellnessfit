class AddAdmissionToFunctionary < ActiveRecord::Migration
  def self.up
    add_column :functionaries, :admission, :date
  end

  def self.down
    remove_column :functionaries, :admission
  end
end
