class ConvertedReceipt < ApplicationRecord
    belongs_to :maintenance_log
    
    def search(string)
       content_text = self.content.downcase
       if content_text[string]
        return true
       else
        return false
       end
    end
end
