class VehiclesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @vehicles = current_user.vehicles 
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
 
  def new
    @vehicles = current_user.vehicles
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    # unless current_user.id == @vehicle.user_id
    #   redirect_to vehicles_path 
    # end
  end

  def create
    byebug
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
   
    if @vehicle.save
      redirect_to new_vehicles_path
    else
      render 'new'
    end
  end  
  
  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
        redirect_to vehicles_path
    else
        render 'edit'
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

    def set_vehicle
      @vehicles = current_user.vehicles
    end

end
