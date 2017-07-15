class Message < ApplicationRecord
  belongs_to :clean_thread

  validates :content, presence: true, length: { maximum: 255 }
  
  
  has_many :users, through: :clean_threads, source: :user
  has_many :clean_companies, through: :clean_threads, source: :clean_company
  
  def posted_by_company?
    return self.clean_company_id.present?
  end

  def posted_by_hotel?
    return self.user_id.present?
  end
  
end