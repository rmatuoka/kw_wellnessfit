class Download < ActiveRecord::Base
  #attr_accessible :name, :archive_file_name, :archive_content_type, :archive_file_size, :archive_updated_at
  has_attached_file :archive,
        :url => "/uploads/:attachment/:id/:basename_:style.:extension",
        :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
        
end
