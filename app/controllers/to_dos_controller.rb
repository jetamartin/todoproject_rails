class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all.includes :tasks
    render('to_dos/index.html.erb')
  end

  def show
    @to_do = ToDo.find(params[:id])
    render('to_dos/show.html.erb')
  end

  def update
    # to_do = params[:to_do]
    # tasks = params[:tasks]
    @to_do = ToDo.find params[:id]
    params.delete('_method')
    params.delete 'controller'
    params.delete 'action'

    @to_do.update params
    # {:to_do => {name: 'my name', :task_attributes => {id: 1, name: 'Do this', is_done:true}}}
    # Task.update task.keys, tasks.values if tasks
    render 'to_dos/show.html.erb'
  end
  #params[:query]
  # /to_dos/search?query=tomorrow
#  def search
#    @to_dos = ToDo.handle_search(params[:query])
#    render action: :index
#  end
end
