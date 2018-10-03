class VehiclesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @vehicles = current_user.vehicles 
  end

  def show
    
    @vehicle = vehicle.find(params[:id])
  end
 
  def new
      @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
   
    if @vehicle.save
       redirect_to vehicles_path
    else
        render 'new'
    end
  end  
  

  def destroy 
    @vehicle = Vehicle.find(params[:id])
      @vehicle.destroy
      redirect_to vehicles_path
  end
 
  

  private

    def vehicle_params
       params.require(:vehicle).permit(:name, :year, :make, :model, :insurance, :vin, :license_plate,
                                       :tire_psi, :registration, :title, :inspection, :color, :user_id)
    end

end
