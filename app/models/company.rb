class Company < ActiveRecord::Base
  has_many :functionaries, :dependent => :destroy
  has_many :bouts, :dependent => :destroy
  has_many :sectors, :dependent => :destroy
  has_many :events, :dependent => :destroy  
  #attr_accessible :company_name, :fantasy_name, :cnpj, :phone, :address, :district, :city, :state, :zip_code, :responsible, :segment, :date_visit, :email, :electronic_address, :doctor, :nurse, :security, :engineering, :rh_responsible, :rh_contact, :gymnastics, :reason_gymnastics, :quality, :map, :absenteeism, :rotation, :male_workers, :female_workers, :agreement
end
