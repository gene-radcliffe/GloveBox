class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        
        @user = current_user
        @vehicles = current_user.vehicles
    end
    
end
