class CleanCompany < ApplicationRecord
  before_save { self.email.downcase! }
  
  validates :tel, presence: true, length: { maximum: 13 }
  validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                uniqueness: { case_sensitive: false }
                
  #validates :image_url, presence: true, length: { maximum: 255 }
  has_many :clean_prefectures
  has_many :prefectures, through: :clean_prefectures
  has_many :workings, through: :clean_prefectures, source: :prefecture
  
  has_many :charges
  
  has_many :clean_reviews
  has_many :users,through: :clean_reviews, source: :user
  
  def working?(prefecture)
    self.workings.include?(prefecture)
  end
  
  
end
