class MachinesController < ApplicationController
  
  def index
    @ransack_params = params[:q] || {}
    @q = Machine.ransack(@ransack_params)
    @machines = @q.result(distinct: true)

    #export to csv
    respond_to do |format|
      format.csv {send_data @machines.to_csv }
      format.html
    end
  end

  def show
    
    @q = Machine.ransack(params[:q])
    @machine = Machine.find(params[:id])
  end
end
