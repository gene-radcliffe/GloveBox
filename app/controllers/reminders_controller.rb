class RemindersController < ApplicationController
  def oilchange
     @reminder = Reminder.new
  end

  def create
    
    type = params[:reminder][:type]
    whitelisted_params = self.send("#{type.downcase}_params") 
    @reminder = Reminder.new(whitelisted_params)
    if @reminder.save
        redirect_to vehicles_path
    else
      flash[:notice]=@reminder.errors.messages
      render 'new'
    end
  end

  def oilchangereminder_params
      params.require(:reminder).permit(:notes, :type, :period)
  end
end
