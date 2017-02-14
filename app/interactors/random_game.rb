class RandomGame
  include Interactor

  delegate :user, to: :context
  def call
    context.game = user.games.order(:name).offset(rand(user.games.count)).first

    context.fail! unless context.game
  end
end
