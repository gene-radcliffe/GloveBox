class VehiclesController < ApplicationController
  before_action :authenticate_user!
  
  require "prawn"

  def publish_pdf
    @current_user = current_user.id
    @vehicles.each do |vehicle|

      Prawn::Document.generate("car.pdf")

    end
  end
  
  
  def index
    @vehicles = Vehicle.all 
  end

  def show
    @vehicle = vehicle.find(params[:id])
  end
 
  def new
      @vehicle = Vehicle.new
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
      @vehicle.destroy
      redirect_to vehicles_path
  end
 
  

  private

    def vehicle_params
       params.require(:vehicle).permit(:name, :year, :make, :model, :insurance, :vin, :license_plate,
                                       :tire_psi, :registration, :title, :inspection)
    end

end
