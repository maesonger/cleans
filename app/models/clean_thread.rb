class CleanThread < ApplicationRecord
  belongs_to :user
  belongs_to :clean_company
  
  has_many :messages,dependent: :destroy
  
  validates :user_id, presence:true
  validates :clean_company_id, presence:true
end
