class ToDo < ActiveRecord::Base
  validates :name, :presence => true

  has_many :tasks

  accepts_nested_attributes_for :tasks

  def open_tasks
    self.tasks.where "not is_done"
  end

  def open_tasks_count
    self.open_tasks.count
  end

end
