class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all.includes(:tasks).order 'name ASC'
    render('to_dos/index.html.erb')
  end

  def show
    @to_do = ToDo.find(params[:id])
    render('to_dos/show.html.erb')
  end

  def update
    # Retrieve to_do item we need from DB
    @to_do = ToDo.find params[:id]

    # Create the update query
    if @to_do.update (params[:to_do])
    #   tasks = @to_do.tasks.select do |task| task.previous_changes.present? end
    #   task_names = tasks.collect do |task| task.name end
    #   task_names = task_names.join(", ")

      task_names = @to_do.tasks.inject([]) do |list, task|
        list << task.name if task.previous_changes.present?
        list
      end.join(", ")

#      flash[:notice] = "Congratulations!!! '#{task_names}' status was successfully updated \n"
      flash[:notice] = task_names

      redirect_to :back #('/to_dos')
    else
      render('to_dos/show.html.erb')
    end
  end
  def archive
  end

end
