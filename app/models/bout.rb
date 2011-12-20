class Bout < ActiveRecord::Base
  belongs_to :company
  has_many :events, :dependent => :destroy
  #attr_accessible :company_id, :name, :description, :active
end
