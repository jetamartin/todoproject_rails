class Task < ActiveRecord::Base
  validates :name, :presence => true
  validates :priority, :presence => true
  belongs_to :to_do

  enum priority: [:urgent, :high, :medium, :low]

end
