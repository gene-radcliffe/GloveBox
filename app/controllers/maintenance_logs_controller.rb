class MaintenanceLogsController < ApplicationController

  def new
    
  end  

  def create 

  end  


  private 
  def maintenance_log_params
    params.require(:maintenance_log).permit(:images, :vehicle_id)
 end

end
