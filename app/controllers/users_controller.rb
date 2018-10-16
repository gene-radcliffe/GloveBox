class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        
        @user = current_user
        @vehicles = current_user.vehicles
    end

    def update
     
       avatar = params[:user][:avatar]
       user_first_name = params[:user][:first_name]
       if user_first_name
            current_user.first_name = user_first_name
            current_user.save
       end
       if avatar
       current_user.avatar.attach(avatar)
       end
       redirect_to user_path(current_user.id)
    end
    
end
