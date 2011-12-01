class Bout < ActiveRecord::Base
  belongs_to :company
  #attr_accessible :company_id, :name, :description, :active
end
