class MaintenanceLogsController < ApplicationController

  def index
    @vehicle = current_user.vehicles.find(params['vehicle_id'])
    @maintenance_logs = @vehicle.maintenance_logs.all
    
  end  

  def show
    @maintenance_logs.maintenance_actions = MaintenanceActions.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = GeneratePdf.new(@maintenance_action)
        send_data pdf.render, 
                  filename: "vehicle_#{@vehicle.name}",
                  type: 'application/pdf',
                  disposition: 'inline'
       end
     end
  end

  def new
    @vehicle = Vehicle.find(params['vehicle_id'])
    @mlog = @vehicle.maintenance_logs.new
    MaintenanceAction::TYPES.map { |t| @mlog.maintenance_actions.build(type: t)}
    
  end  

  def history
    @vehicles = current_user.vehicles
  end

  def create 
    byebug
    @vehicle = Vehicle.find(params['vehicle_id'])
    @mlog = @vehicle.maintenance_logs.create(:image => params[:maintenance_log][:image])
    
    actions = params[:selected_actions].split(",")
    actions.map do |t|
      whitelisted_params = self.send("#{t.downcase}_params") 
      @mlog.maintenance_actions.build(whitelisted_params.merge(type: t)).save
    end  
    redirect_to vehicles_path

  end  


  private 
  def maintenance_log_params
    params.require(:maintenance_log)
  end
  
  def oilchange_params 
    maintenance_log_params[:oilchange].permit(:mileage, :oil_type, :service_date, :cost, :notes)
  end 

  def brake_params 
    maintenance_log_params[:brake].permit(:mileage, :brake_location, :service_date, :cost, :notes)
  end 

  def rotor_params 
    maintenance_log_params[:rotor].permit(:mileage, :rotor_location, :service_date, :cost, :notes)
  end 

  def tirerotation_params 
    maintenance_log_params[:tire_rotation].permit(:mileage, :service_date, :cost, :notes)
  end 

  def tirereplacement_params 
    maintenance_log_params[:tire_replacement].permit(:mileage, :tire_location, :service_date, :cost, :notes)
  end 

  def alignment_params 
    maintenance_log_params[:Alignment].permit(:mileage, :service_date, :cost, :notes)
  end 

  def powersteeringfluid_params 
    maintenance_log_params[:powersteeringfluid].permit(:mileage, :service_date, :cost, :notes)
  end 

  def antifreeze_params 
    maintenance_log_params[:antifreeze].permit(:mileage, :service_date, :cost, :notes)
  end 

  def transmissionfluid_params 
    maintenance_log_params[:transmissionfluid].permit(:mileage, :service_date, :cost, :notes)
  end 


  def brakefluid_params 
    maintenance_log_params[:brakefluid].permit(:mileage, :service_date, :cost, :notes)
  end 

  def miscellaneous_params 
    maintenance_log_params[:miscellaneous].permit(:mileage, :service_date, :cost, :notes)
  end 

end
