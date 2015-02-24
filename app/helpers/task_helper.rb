module TaskHelper
  def classify_task_by_age task
    if Date.today - task.due_date
      # 'class="old_task"'.html_safe if  > 5
    end
  end
end
