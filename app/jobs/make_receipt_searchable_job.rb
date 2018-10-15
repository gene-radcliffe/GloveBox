class MakeReceiptSearchableJob < ApplicationJob
  queue_as :default

  def perform(maintenance_log)
    
    File.open("maintenance_log_#{maintenance_log.id}.jpg",'wb') do |file|
      maintenance_log.image.download do |chunk|
            file.write(chunk)
      end
        @file = file
    end
    
    image = RTesseract.new(@file, :processor => "mini_magick")
    pdf = image.to_pdf
    string_data = image.to_s

    #save to database 
    
  end
end
