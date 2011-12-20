class StatusPresence < ActiveRecord::Base
  #attr_accessible :name, :abbreviation
  has_many :presences
  
  def self.all_unblock
    StatusPresence.all(:conditions => ['id != ?', STATUS_PRESENCA_PADRAO])
  end
end
