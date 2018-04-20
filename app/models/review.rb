class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true

  def char_count
    if self.content.size  >= 50 && self.content.size <= 250
      return self.content
    else
      return "invalid review"
    end  
  end
end
