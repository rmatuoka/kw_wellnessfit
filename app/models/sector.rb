class Sector < ActiveRecord::Base
  belongs_to :company
  has_many :functionaries, :dependent => :destroy
  #attr_accessible :company_id, :name, :description, :active
end
