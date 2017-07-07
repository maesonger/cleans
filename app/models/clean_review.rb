class CleanReview < ApplicationRecord
  belongs_to :user
  belongs_to :clean_company
  
  validates :user_id, presence:true
  validates :clean_company_id, presence:true
  
  validates :point, presence: true, length: { maximum: 5 }
  validates :comment, presence: true, length: { maximum: 255 }
end
