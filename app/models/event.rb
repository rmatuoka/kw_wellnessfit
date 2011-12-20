class Event < ActiveRecord::Base
  #attr_accessible :bout_id, :event_date, :employees_present, :observation,  :sector_attributes, :sector_ids
  belongs_to :bout
  belongs_to :company
  has_many :presences
  has_and_belongs_to_many :sectors
end
