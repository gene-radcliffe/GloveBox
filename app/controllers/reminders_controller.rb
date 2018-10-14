class RemindersController < ApplicationController
  def oilchange
     @reminder = Reminder.new
  end

  def create
    
    type = params[:reminder][:type]
    if type=="OilChangeReminder"
      saveOilChangeReminder(type)
    end
     
    if @reminder.save
      reminder = @reminder
      sendEmail(current_user, reminder)
      createDelayedJob(current_user, reminder)
     
    
      redirect_to vehicles_path
    else
      flash[:notice]=@reminder.errors.messages
      render 'new'
    end
  end

  def createDelayedJob(user, reminder)
    case reminder.period
    when "3 Months from now"
      MaintenanceActionJob.set(wait: 9.seconds).perform_later(user, reminder)
    when "5 Months from now"
      MaintenanceActionJob.set(wait: 15.seconds).perform_later(user, reminder)
    end
  end
  def sendEmail(user, reminder)
    GloveBoxMailer.reminder(user,reminder).deliver_now
  end
  def saveOilChangeReminder(type)
    whitelisted_params = self.send("#{type.downcase}_params") 
    @reminder = Reminder.new(whitelisted_params)
    action_date = whitelisted_params[:period]
   
    case action_date
    when "3 Months from now"
      @reminder.action_date = 3.months.from_now
    when "5 Months from now"
      @reminder.action_date = 5.months.from_now
    end
       
  end
  def oilchangereminder_params
      params.require(:reminder).permit(:notes, :type, :period)
  end
end
