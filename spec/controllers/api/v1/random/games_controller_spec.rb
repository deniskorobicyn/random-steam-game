require 'rails_helper'

RSpec.describe Api::V1::Random::GamesController, type: :controller do
  let(:user) { create :user }
  let!(:game) { create :game, users: [user] }

  describe "GET #index" do
    context 'when user logged in' do
      before do
        sign_in user
      end

      it "returns http success for success call" do
        allow(::Choosers::PickGame).to receive(:call).with(user: user, genre_ids: nil).and_return(double('Interactor::Context', "success?" => true, game: game))
        get :index

        expect(response).to have_http_status(:success)
      end

      it "returns not found for failed call" do
        allow(::Choosers::PickGame).to receive(:call).with(user: user, genre_ids: nil).and_return(double('Interactor::Context', "success?" => false))
        get :index

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
