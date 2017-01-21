require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  before do
    sign_in(create :user)
     allow(Steam::UserStats).to receive(:game_schema).with(320).and_return({})
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
