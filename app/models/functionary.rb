class Functionary < ActiveRecord::Base
  belongs_to :company
  belongs_to :sector
  #attr_accessible :company_id, :sector_id, :name, :internal_code, :active, :inactivation_date, :reason, :sex
end
