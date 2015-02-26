class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('to_dos/index.html.erb')
  end

# Started Update Method -- but not finished or tested. Need to come back to this
  def update
    @task = Task.find(params[:id])
    if @task
      @task.update(params[:task])
    end

    flash[:notice] = @task.name
    redirect_to(to_do_path(@task.to_do_id))

  end

  def new
    @to_do = ToDo.find(params[:id])
    puts "To Do found = #{@to_do}"
#    @to_do_id = params[:id]

    @task = Task.new
    # Need to add current to_do id into new to set select button
    @to_do_names_and_ids = ToDo.all.map{|t| [t.name, t.id]}
    render('tasks/edit.html.erb')
  end

  def create
    @task = Task.new
    @task.to_do_id = params[:to_do_id]
    @task = Task.create(params[:task])
    # Need to retrieve to_do record as it is required for show view
    @to_do = ToDo.find(@task.to_do_id)
    redirect_to(to_do_path(@task.to_do_id))
  end

  def edit

    @task = Task.find(params[:id])
    puts "=====> Edit Task Name #{@task.name}"
    puts "=====> To Do Name: #{@task.to_do.name}"
    # @to_do = @task.to_do
    @to_do = ToDo.find(@task.to_do_id)
    @to_do_names_and_ids = ToDo.all.map{|t| [t.name, t.id]}
  end
 # Added this as a placeholder
  def archive
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find params[:id]
    @to_do = @task.to_do
    @task.destroy
    flash[:notice] = @task.name
    redirect_to(@to_do)
  end


  #   @task = Task.find(params[:id])
  #   if @task.update(:is_done => params[:is_done])
  #     ### May need to create this.
  #     render('to_dos/success.html.erb')
  #
  #   else
  #     render('to_dos/edit.html.erb')
  #   end
  # end

  #params[:query]
  # /to_dos/search?query=tomorrow
  #  def search
  #    @to_dos = ToDo.handle_search(params[:query])
  #    render action: :index
  #  end
end
