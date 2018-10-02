class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all 
  end

  def show
    @vehicle = vehicle.find(params[:id])
  end
 
  def new
    # if current_user
      @vehicle = Vehicle.new
    # else
    #   flash[:notice] ="You must be logged to add a Vehicle."
    #   redirect_to new_session_path
    # end
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
   
    if @vehicle.save
       redirect_to @vehicle
    else
        render 'new'
    end
  end  
  

  def destroy 
    @vehicle = Vehicle.find(params[:id])
    if current_user.id == @vehicle.user_id
      @vehicle.destroy
      redirect_to vehicles_path
    else
      flash[:notice] = 'Only vehicle creator can delete.'
      redirect_to @vehicle
    end
  end
 
  

  private

    def vehicle_params
       params.require(:vehicle).permit(:name, :year, :make, :model, :insurance, :vin, :license_plate,
                                       :tire_psi, :registration, :title, :inspection)
    end

end
