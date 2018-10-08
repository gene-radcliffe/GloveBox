class MaintenanceActionsController < ApplicationController
  def index  

  end  

  def new 
    @maintenance_action = Maintenance_action.new 
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
