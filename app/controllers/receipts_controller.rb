class ReceiptsController < ApplicationController

    def index
        @vehicle = current_user.vehicles.find(params['vehicle_id'])
        @maintenance_logs = MaintenanceLog.where("vehicle_id = #{params[:vehicle_id]}" )
    end
end
