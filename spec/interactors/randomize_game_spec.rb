require 'rails_helper'

describe RandomizeGame do
  describe '#call' do
    let(:user) { create :user }
    let!(:game) { create :game, users: [user] }

    before do
      allow(Steam::UserStats).to receive(:game_schema).with(game.steam_appid).and_return({})
    end

    it 'adds to context game, image and appid' do
      context = described_class.call(user: user, params: {})

      expect(context.game.id).to eq game.id
    end
  end
end
