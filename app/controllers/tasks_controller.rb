class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('to_dos/index.html.erb')
  end

  def update
  
  end
  #params[:query]
  # /to_dos/search?query=tomorrow
  #  def search
  #    @to_dos = ToDo.handle_search(params[:query])
  #    render action: :index
  #  end
end
