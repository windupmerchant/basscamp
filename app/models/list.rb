class List < ActiveRecord::Base
  attr_accessible :name

  belongs_to 	:project
  has_many		:items
  
end
