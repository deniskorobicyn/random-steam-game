require 'rails_helper'

describe RandomGame do
  describe '#call' do
    let(:user) { create :user }

    it 'adds to context game, image and appid' do
      context = RandomGame.call(user: user)
      expect(context.game).to eq 'Half-Life 2: Deathmatch'
      expect(context.appid).to eq 320
      expect(context.img).to include '6dd9f66771300f2252d411e50739a1ceae9e5b30'
    end
  end
end
