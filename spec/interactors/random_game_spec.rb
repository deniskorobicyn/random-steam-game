require 'rails_helper'

describe RandomGame do
  describe '#call' do
    let(:user) { create :user }
    let!(:game) { create :game, users: [user] }

    it 'adds to context game, image and appid' do
      context = RandomGame.call(user: user, params: {})

      expect(context.game.id).to eq game.id
    end
  end
end
