class User < ApplicationRecord
  has_secure_password
  
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
  validates :tel, presence: true, length: { maximum: 11 }#,
                    #format: { with: /^\d{10}$|^\d{11}$/}
                  
  has_secure_password
  
  has_many :clean_reviews
  has_many :clean_companies
  has_many :reviewings ,through: :clean_reviews, source: :clean_company
  
  has_many :clean_threads
  has_many :messages, through: :clean_threads, source: :message
  
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

end