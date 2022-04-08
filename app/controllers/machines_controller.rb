class MachinesController < ApplicationController
  
  def index
    #filtravimas
    if params[:filter] == 'zip'
      @machines = Machine.where(ZIP: params[:query])

    elsif params[:filter] == 'name'
      query = params[:query].gsub("+", " ")
      @machines = Machine.where("lower(NAME) LIKE lower(?)", "%#{query}%")
      
    elsif params[:filter] == 'address'
      query = params[:query]
      query.gsub!("+", " ")
      query.gsub!("%2C+", ", ")
      query.gsub!("%2C" ", ")
      @machines = Machine.where("lower(FULL_ADDRESS) LIKE lower(?)", "%#{query}%")
    else
      @machines = Machine.all()
    end

    #export to csv
    respond_to do |format|
      format.csv {send_data @machines.to_csv }
      format.html
    end
  end

  def show
    @machine = Machine.find(params[:id])
  end
end
