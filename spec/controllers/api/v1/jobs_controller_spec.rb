require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do
  let(:user) { create :user }
  let(:job_id) { 'asdfdg2131' }

  describe "GET #show" do
    context 'when user is authenticated' do
      before do
        sign_in user
      end

      it "returns 200" do
        expect(::Sidekiq::Status).to receive(:get_all).with(job_id)
        get :show, params: {id: job_id}

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is unauthenticated' do
      it "returns 302" do
        expect(::Sidekiq::Status).to_not receive(:get_all).with(job_id)
        get :show, params: {id: job_id}

        expect(response).to have_http_status(302)
        expect(response.location).to end_with "/users/sign_in"
      end
    end
  end
end
