class MaintenanceLogsController < ApplicationController

  def new
    @vehicle = Vehicle.find(params['vehicle_id'])
    @mlog = @vehicle.maintenance_logs.new
    
    @mlog.maintenance_actions.build(type: "OilChange")
    @mlog.maintenance_actions.build(type: "Brake")
    @mlog.maintenance_actions.build(type: "Rotor")
    @mlog.maintenance_actions.build(type: "TireRotation")
    @mlog.maintenance_actions.build(type: "TireReplacement")
    @mlog.maintenance_actions.build(type: "Alignment")
    @mlog.maintenance_actions.build(type: "PowerSteeringFluid")
    @mlog.maintenance_actions.build(type: "Antifreeze")
    @mlog.maintenance_actions.build(type: "TransmissionFluid")
    @mlog.maintenance_actions.build(type: "BrakeFluid")
    @mlog.maintenance_actions.build(type: "Miscellaneous")
    
  end  

  def create 
      

  end  


  private 
  def maintenance_log_params
    params.require(:maintenance_log).permit(:images, :vehicle_id)
 end

end
