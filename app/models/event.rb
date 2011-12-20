class Event < ActiveRecord::Base
  #attr_accessible :bout_id, :event_date, :employees_present, :observation
  belongs_to :bout
  belongs_to :company
end
