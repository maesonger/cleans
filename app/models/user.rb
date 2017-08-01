class User < ApplicationRecord
  has_secure_password
  
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :tel, length: { maximum: 11 },
                    format: { with: /\A\d{10}$|^\d{11}\z/}
              
  has_secure_password
  
  has_many :clean_reviews
  has_many :clean_companies
  has_many :reviewings ,through: :clean_reviews, source: :clean_company
  
  has_many :clean_threads
  has_many :messages, through: :clean_threads, source: :message
  
  validates :password, presence: false, on: :facebook_login
  validates :tel, presence: false, on: :facebook_login
  
  def is_hotel
    if ( account_type == 1 )
      true
    end
  end

  def is_clean_company
    if ( account_type == 2 )
      true
    end
  end

  def get_thread_id(company)
    clean_threads.where(clean_company_id: company.id).first.id
  end

  # ユーザーが引数に受けた清掃業者とのスレッドを持っているか判定する
  def has_thread?(company)
    # present? は値があれば true、なければ false を返す便利メソッドです
    # http://railsdoc.com/references/present
    return CleanThread.where(user_id: self.id, clean_company_id: company.id).present?
    # if CleanThread.find_by(clean_company_id: company.id) && CleanThread.find_by(user_id: current_user.id)
      # true
    # else
      # false
    # end
  end
  
  def self.from_omniauth(auth)
        # emailの提供は必須とする
    user = User.where('email = ?', auth.info.email).first
    if user.blank?
      user = User.new
    end
    user.uid   = auth.uid
    user.provider   = auth.provider
    user.name  = auth.info.name
    user.email = auth.info.email
    user.image_url  = auth.info.image
    user.password = auth.uid
    user.oauth_token      = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.f_email = auth.info.email
    user
    
  end
  
  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end