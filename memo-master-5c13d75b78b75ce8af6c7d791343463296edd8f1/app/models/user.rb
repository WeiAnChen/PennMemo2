class User < ActiveRecord::Base
  require 'securerandom'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

   def self.from_omniauth(auth)
    user_info = JSON.parse(auth['extra']['raw_info']['body']).first
    where(provider: auth['provider'], uid: auth['uid']).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = user_info['EmailAddress']
      user.name = user_info['UserFullname']
      user.password = SecureRandom.hex(32)
    end
  end
end
