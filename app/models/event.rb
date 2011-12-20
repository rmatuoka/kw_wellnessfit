class Event < ActiveRecord::Base
  #attr_accessible :bout_id, :event_date, :employees_present, :observation
  belongs_to :bout
  belongs_to :company
  
  has_and_belongs_to_many :sectors
  attr_accessible :sector_attributes
end
