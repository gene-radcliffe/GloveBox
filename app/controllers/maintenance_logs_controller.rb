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
    @vehicle = Vehicle.find(params['vehicle_id'])
    @mlog = @vehicle.maintenance_logs.new
    actions = params[:selected_actions].split(",")
    actions.map do |t|
      @mlog.maintenance_actions.build(type: t)
      byebug
      whitelisted_params = self.send("#{t.downcase}_params") 
    end  
      

  end  


  private 
  def maintenance_log_params
    params.require(:maintenance_log)
  end
  
  def oilchange_params 
    maintenance_log_params[:oilchange].permit(:mileage, :oil_type, :service_date, :cost, :notes)
  end 

  def brake_params 
    maintenance_log_params[:oilchange].permit(:mileage, :brake_location, :service_date, :cost, :notes)
  end 

  def rotor_params 
    maintenance_log_params[:oilchange].permit(:mileage, :rotor_location, :service_date, :cost, :notes)
  end 

  def TireRotation_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

  def TireReplacement_params 
    maintenance_log_params[:oilchange].permit(:mileage, :tire_location, :service_date, :cost, :notes)
  end 

  def Alignment_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

  def PowerSteeringFluid_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

  def AntiFreeze_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

  def TransmissionFluid_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 


  def BrakeFluid_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

  def Miscellaneous_params 
    maintenance_log_params[:oilchange].permit(:mileage, :service_date, :cost, :notes)
  end 

end
