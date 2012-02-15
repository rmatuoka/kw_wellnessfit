class SectorFunctionary < ActiveRecord::Base
  #attr_accessible :functionary_id, :sector_id, :start_date, :end_date
  belongs_to :sector
  belongs_to :functionary
  
  def self.sectornow
    self.find(:all, :conditions=>["end_date is null"], :limit => 1)
  end
end
