class Game < ApplicationRecord
  validates :name, uniqueness: true, presence: true


  has_many :user_games
  has_many :users, through: :user_games

  has_many :game_genres
  has_many :genres, through: :game_genres

  scope :with_genres, ->(ids) do
    joins(:game_genres).where(game_genres: {genre_id: ids})
  end

  def full_image_url
    return unless steam_appid
    "http://media.steampowered.com/steamcommunity/public/images/apps/#{steam_appid}/#{image_url}.jpg"
  end
end
