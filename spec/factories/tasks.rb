FactoryGirl.define do
  factory :task do
    name              'Name of the task'
    is_done           'TRUE'
    due_date          '2015-02-15'
    task_notes        'This is task #1'
    completion_date   '2015-02-16'
    is_archived_task  false
    priority          :high
  end
end
