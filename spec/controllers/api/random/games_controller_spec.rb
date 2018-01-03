require 'rails_helper'

RSpec.describe Api::V1::Random::GamesController, type: :controller do
  let(:user) { create :user }
  let!(:game) { create :game, users: [user] }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
