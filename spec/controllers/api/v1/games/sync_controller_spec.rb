require 'rails_helper'

RSpec.describe Api::V1::Games::SyncController, type: :controller do
  let(:user) { create :user }

  describe "POST #create" do
    context 'when user is authenticated' do
      before do
        sign_in user
      end

      it "returns 202" do
        expect(::Games::Sync::Steam::GamesWorker).to receive(:perform_async).with(user.id)
        post :create

        expect(response).to have_http_status(:accepted)
      end
    end
  end
end
