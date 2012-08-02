class Project < ActiveRecord::Base
  attr_accessible :description, :private, :title

  belongs_to 	:user
  has_many 		:items, :through => :lists
  
end
