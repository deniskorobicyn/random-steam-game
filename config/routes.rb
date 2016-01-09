Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :random_game, only: :index
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'
end
