class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
  validates :rating, :inclusion => 1..5
  validates :content, length: { in: 50..250 }

  def char_count
    if self.content.size  >= 50 && self.content.size <= 250
      return self.content
    else
      return "invalid review"
    end
  end

  def rating_check
    if self.rating >0 && self.rating <= 5
      return self.rating
    else
      return "invalid  rating"
    end
  end
end
