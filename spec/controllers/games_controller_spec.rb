require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:user) { create :user }
  let!(:game) { create :game }
  let!(:user_game) { create :user_game, user: user, game: game }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    let!(:other_game) { create :game }

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
      expect(assigns(:games).map(&:id)).to match_array([game.id])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "returns http success" do
      expect do
        post :create, params: { game: {name: 'test'} }

        expect(response).to have_http_status(302)
      end.to change { user.games.count }
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: game.id}

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH update" do
    it "returns http success" do
      patch :update, params: {id: game.id, game: {name: 'test'} }

      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE destroy" do
    it "returns http success" do
      delete :destroy, params: {id: game.id}

      expect(response).to have_http_status(302)
    end
  end
end
