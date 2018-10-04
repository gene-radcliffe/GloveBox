class UsersController < ApplicationController

    def show
       
        @vehicles = current_user.vehicles
    end
    
end
