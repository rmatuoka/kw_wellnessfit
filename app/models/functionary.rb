class Functionary < ActiveRecord::Base
  belongs_to :company
  belongs_to :sector
  has_many :presences, :dependent => :destroy
  #attr_accessible :company_id, :sector_id, :name, :internal_code, :active, :inactivation_date, :reason, :sex
end
