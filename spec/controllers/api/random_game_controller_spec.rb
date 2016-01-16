require 'rails_helper'

RSpec.describe Api::RandomGameController, type: :controller do
  let(:user) { create :user }

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
