class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:steam]

  has_many :user_games
  has_many :games, through: :user_games

  def self.find_or_create_steam_oauth(auth, signed_in_resource=nil)
    user = User.find_or_initialize_by(provider: auth.provider, steamid: auth.uid)

    user.nickname = auth.info.nickname
    user.email = 'no-email@steam.provider'
    user.password = Devise.friendly_token[0,20]
    user.steamid = auth.uid

    user.save!
    user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
