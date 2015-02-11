class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all.includes :tasks
    render('to_dos/index.html.erb')
  end

  #params[:query]
  # /to_dos/search?query=tomorrow
#  def search
#    @to_dos = ToDo.handle_search(params[:query])
#    render action: :index
#  end
end
