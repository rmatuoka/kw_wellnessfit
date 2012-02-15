class Sector < ActiveRecord::Base
  belongs_to :company
  has_many :functionaries, :dependent => :destroy
  has_many :sector_functionaries
  has_many :bout_functionaries  
  has_many :presences   
  has_and_belongs_to_many :events
  #attr_accessible :company_id, :name, :description, :active
  
  def self.all_active
    Sector.all(:conditions => ['active = true'])
  end
end
