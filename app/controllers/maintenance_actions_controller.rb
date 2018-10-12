class MaintenanceActionsController < ApplicationController
  def show
    # @vehicle = current_user.vehicles.find(params['vehicle_id'])
    # @maintenance_logs = @vehicle.maintenance_logs.all
    @maintenance_action = MaintenanceAction.find(params[:id])
    
  end  

  def new 
    @maintenance_action = Maintenance_action.new 
  end

  def edit
    @maintenance_action = Maintenance_action.find(params[:id])  
  
  
  end
  
  def oilchange
    @oilchange = OilChange.new
  end  

  def create 
    @maintenance_action
  end 

  def destroy 

  end
  
  private 
  def maintenance_action_params
    params.require(:maintenance_action).permit(:maintenance_log_id, :type, :mileage, :oil_type, :service_date, :cost, :tire_location, :brake_location, :rotor_location, :notes, :selected)
 end

  
end
