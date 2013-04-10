class Course < ActiveRecord::Base
  attr_accessible :catalog_number, :blok, :description, 
  				  :ec, :institute, :maximum, :name, 
  				  :programme, :staff

  has_and_belongs_to_many :staffs
  has_and_belongs_to_many :programmes

end
