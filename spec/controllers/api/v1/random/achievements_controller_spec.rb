require 'rails_helper'

RSpec.describe Api::V1::Random::AchievementsController, type: :controller do
  let(:user) { create :user }

  describe "GET #show" do
    let(:appid) { '13123' }
    context 'when user is present' do
      before do
        sign_in user
      end

      context 'when all good' do
        it "returns OK" do
          allow(::Choosers::PickAchievement).to receive(:call).with(appid: appid).and_return(double('Interactor::Context', "success?" => true, achievement: {}))
          get :show, params: {steam_appid: appid}

          expect(response).to have_http_status(:ok)
        end
      end

      context 'when service returns fail' do
        it 'returns not found' do
          allow(::Choosers::PickAchievement).to receive(:call).with(appid: appid).and_return(double('Interactor::Context', "success?" => false))
          get :show, params: {steam_appid: appid}

          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
