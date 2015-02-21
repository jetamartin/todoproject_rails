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
    redirect_to(to_do_path(@task.to_do_id))

  end

  def new
    @tasks = Task.new
    @to_do_names_and_ids = ToDo.all.map{|t| [t.name, t.id]}
    render('tasks/new.html.erb')
  end

  def edit
    @task = Task.find(params[:id])

  end
 # Added this as a placeholder
  def archive
    @task = Task.find(params[:id])
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
