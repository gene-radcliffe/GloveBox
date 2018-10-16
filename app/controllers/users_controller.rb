class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        
        @user = current_user
        @vehicles = current_user.vehicles
    end

    def update
       avatar = params[:user][:avatar]
       current_user.avatar.attach(avatar)
       redirect_to user_path(current_user.id)
    end
    
end
