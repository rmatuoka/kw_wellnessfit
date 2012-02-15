class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :name
      t.string :archive_file_name
      t.string :archive_content_type
      t.integer :archive_file_size
      t.datetime :archive_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
