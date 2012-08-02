class Item < ActiveRecord::Base
  attr_accessible :assigned_to, :body, :completed_at

  belongs_to :user
  belongs_to :list

end
