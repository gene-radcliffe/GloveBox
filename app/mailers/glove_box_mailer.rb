class GloveBoxMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.glove_box_mailer.reminder.subject
  #
  def reminder(user, reminder)
    @greeting = "Greetings, From GloveBox!"
    @reminder=reminder
    mail(to: user.email,
         from: 'app110448060@heroku.com',
         subject: "Maintenance Reminder")
  end


end
