class RandomizeGame
  include Interactor::Organizer

  organize Choosers::PickGame, Choosers::PickAchievement
end
