class UsersController < ApplicationController

    def show
        
        
        @user= current_user
        @vehicles = current_user.vehicles
    end
    
end
