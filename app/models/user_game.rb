class UserGame < ApplicationRecord
  validates :game, :user, presence: true

  belongs_to :game
  belongs_to :user

  def test
    if test
    end
  end
end