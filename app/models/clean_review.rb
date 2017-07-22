class CleanReview < ApplicationRecord
  belongs_to :user
  belongs_to :clean_company
  
  validates :user_id, presence:true
  validates :clean_company_id, presence:true
  
  validates :point, presence: true, length: { maximum: 5 }
  validates :comment, presence: true, length: { maximum: 255 }
  
  
  def getpoint
    if self.point <= "5" && self.point > "4"
      '⭐️⭐⭐⭐⭐️'
    elsif self.point <= "4" && self.point > "3"
      '⭐⭐⭐⭐'
    elsif self.point <= "3" && self.point > "2"
      '⭐⭐⭐'
    elsif self.point <= "2" && self.point > "1"
      '⭐⭐'
    elsif self.point <= "1"
      '⭐'
    end
  end
  
  
end
