require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_many(:user_games) }
end
