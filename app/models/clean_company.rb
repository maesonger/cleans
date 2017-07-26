class CleanCompany < ApplicationRecord
  before_save { self.email.downcase! }

  mount_uploader :image_url, ImageUploader

  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :tel, presence: true, length: { maximum: 11 },
                format: { with: /\A\d{10}$|^\d{11}\z/}
  validates :image_url, presence: true, on: [:create]

  has_many :clean_prefectures,dependent: :delete_all
  has_many :prefectures, through: :clean_prefectures
  has_many :workings, through: :clean_prefectures, source: :prefecture
  
  has_many :charges,dependent: :delete_all
  
  has_many :clean_reviews,dependent: :delete_all
  has_many :users,through: :clean_reviews, source: :user

  has_many :clean_threads,dependent: :destroy
  has_many :message_users,through: :clean_threads, source: :clean_company

  def working?(prefecture)
    self.workings.include?(prefecture)
  end

  def contact(account_type,user_id)
    if account_type == 2 && user_id != params[:id]
      return false
    else
      return true
    end  
  end

  def self.search(search)
    if search
      self.where(['prefecture_id LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      self.all #全て表示。User.は省略
    end
  end

end
