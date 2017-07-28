class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_secure_password
  
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :tel, presence: true, length: { maximum: 11 },
                    format: { with: /\A\d{10}$|^\d{11}\z/}
                  
  has_secure_password
  
  has_many :clean_reviews
  has_many :clean_companies
  has_many :reviewings ,through: :clean_reviews, source: :clean_company
  
  has_many :clean_threads
  has_many :messages, through: :clean_threads, source: :message
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end
  
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
  
  private
  
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end