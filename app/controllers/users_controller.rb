class UsersController < ApplicationController

    def show
        byebug
        
        @user= current_user
        @vehicles = current_user.vehicles
    end
    
end
