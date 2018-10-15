# Preview all emails at http://localhost:3000/rails/mailers/glove_box_mailer
class GloveBoxMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/glove_box_mailer/reminder
  def reminder
    GloveBoxMailer.reminder
  end

end
