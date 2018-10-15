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
    @vehicle = Vehicle.find(params['vehicle_id'])
    @mlog = @vehicle.maintenance_logs.create(:image => params[:maintenance_log][:image])
    
    actions = params[:selected_actions].split(",")
    actions.map do |t|
      whitelisted_params = self.send("#{t.downcase}_params") 
      @mlog.maintenance_actions.build(whitelisted_params.merge(type: t)).save
    end  

    if @mlog.image.attached?
      MakeReceiptSearchable.set(wait: 2.minutes).perform_later(@mlog)
    end
    
    if params[:reminder] == "true"
      redirect_to reminders_oilchange_path
    else
      redirect_to vehicles_path
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
  #
  # def checkIfRecentOilChange(oil_type, date)

  #   case oil_type
  #   when "Regular"
  #     if regularOil(date)
  #       return true
  #     else 
  #       return false
  #     end
  #   when "Synthetic"
  #     if syntheticOil(date)
  #       return true
  #     else 
  #       return false
  #     end
  #  end
  # end
  # def regularOil(sDate)

  #   date = Date.today
  #     if sDate > date.months_ago(3) && sDate < date  #if within 3 months ago
  #       true
  #     else
  #       false
  #     end
  #   end
    
  #   def syntheticOil(sDate)
    
  #   date = Date.today
  #     if sDate > date.months_ago(5) && sDate < date #if within 3 months ago
  #       true
  #     else
  #       false
  #     end
  #   end
  # end
  #
end
