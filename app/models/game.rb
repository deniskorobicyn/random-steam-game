class Game < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :user_games
  has_many :users, through: :user_games

  def full_image_url
    return unless steam_appid
    "http://media.steampowered.com/steamcommunity/public/images/apps/#{steam_appid}/#{image_url}.jpg"
  end
end