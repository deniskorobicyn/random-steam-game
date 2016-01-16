Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api, defaults: {format: :json} do
    namespace :random do
      resources :games, only: :index
      resources :achievements, only: :index
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root 'home#index'
  end

  unauthenticated do
    root 'welcome#index', as: :unauthenticated_root
  end
end
