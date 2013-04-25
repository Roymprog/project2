class Course < ActiveRecord::Base
  attr_accessible :catalog_number, :period, :blok, :description, 
  				  :ec, :institute, :maximum, :name
  				
  has_and_belongs_to_many :staffs
  has_and_belongs_to_many :programmes

end
