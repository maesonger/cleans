class User < ApplicationRecord
  has_secure_password
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :tel, presence: true, length: { maximum: 11 }
  has_secure_password
  
  has_many :clean_reviews
  has_many :clean_companies
  has_many :clean_companies,through: :clean_reviews, source: :clean_company
end
