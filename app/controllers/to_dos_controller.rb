class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all.includes(:tasks).order 'name ASC'
    render('to_dos/index.html.erb')
  end

  def show
    @to_do = ToDo.find(params[:id])
    render('tasks/show.html.erb')
  end

  def create
    @to_do = ToDo.new
    if ToDo.create(params[:to_do])
      # flash[:notice] = @to_do.name
      render('to_dos/index.html.erb')
    # else (if error occured)
      # render('to_dos_path')
    end
  end

  def edit
    @to_do = ToDo.find params[:id]

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

     flash[:notice] = "Congratulations!!! '#{task_names}' status was successfully updated \n"
      # flash[:notice] = task_names

      redirect_to to_dos_path
    else
      render('to_dos/show.html.erb')
    end
  end

  def new
    @to_do = ToDo.new
    render('to_dos/new.html.erb')
  end

  def new_task
    @to_do = ToDo.find(params[:id])

    @task = Task.new
    # Need to add current to_do id into new to set select button
    @to_do_names_and_ids = ToDo.all.map{|t| [t.name, t.id]}
    render('tasks/new.html.erb')
  end
  def archive

  end
  def delete
    ToDo.destroy(params(:id))
    redirect_to(to_dos_path)
  end

end
