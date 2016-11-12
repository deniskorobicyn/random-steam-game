class Game < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :user_games
  has_many :users, through: :user_games
end
