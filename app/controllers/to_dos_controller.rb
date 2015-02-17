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
    @to_do.update params[:to_do]

    redirect_to :back #('/to_dos')
  end

end
