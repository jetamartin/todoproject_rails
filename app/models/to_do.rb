class ToDo < ActiveRecord::Base
  validates :name, :presence => true
end
