require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:games) }
  it { should have_many(:user_games) }
end
