class MaintenanceActionsController < ApplicationController


  def show
    @maintenance_action = MaintenanceAction.find(params[:id])
    @maintenance_log = MaintenanceLog.find_by_id(@maintenance_action.maintenance_log_id)
    @vehicle = Vehicle.find_by_id(@maintenance_log.vehicle_id)
  end  

  # def index
    
  #   @maintenance_actions = MaintenanceAction.all
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       pdf = GeneratePdf.new(@maintenance_actions)
  #       send_data pdf.render, 
  #                 filename: "Export",
  #                 type: 'application/pdf',
  #                 disposition: 'inline'
       
  #     end
  #   end
  # end
 
  def new 
    @maintenance_action = Maintenance_action.new 
  end

  def edit
    @maintenance_action = MaintenanceAction.find(params[:id])  
  
  end
  
  def update
    @maintenance_action = MaintenanceAction.find(params[:id])

    if @maintenance_action.update(maintenance_action_params)
        redirect_to maintenance_action_path
    else
        render 'edit'
    end
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

