class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]
          
  def self.find_for_oauth(auth)
    member = Member.where(uid: auth.uid, provider: auth.provider).first

    unless member
      member = Member.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    Member.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    member
    
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
