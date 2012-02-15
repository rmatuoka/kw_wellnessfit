class Presence < ActiveRecord::Base
  belongs_to :functionary
  belongs_to :event
  belongs_to :status_presence
  belongs_to :sector
end
