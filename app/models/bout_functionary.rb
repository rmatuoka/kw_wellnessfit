class BoutFunctionary < ActiveRecord::Base
  #attr_accessible :functionary_id, :bout_id, :start_date, :end_date´
  belongs_to :bout
  belongs_to :functionary
  
  def self.boutnow
    self.find(:all, :conditions=>["end_date is null"], :limit => 1)
  end
end
