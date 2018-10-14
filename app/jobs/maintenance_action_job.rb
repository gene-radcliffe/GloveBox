class MaintenanceActionJob < ApplicationJob
  queue_as :default

  def perform(user, reminder)
    @user = user
    @reminder = reminder

    GloveBoxMailer.reminder(@user,@reminder).deliver_later
  end
end
