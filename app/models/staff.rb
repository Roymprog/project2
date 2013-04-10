class Staff < ActiveRecord::Base
  attr_accessible :name, :url

  has_and_belongs_to_many :courses
end
