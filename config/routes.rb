Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :random do
        resources :games, only: :index
        resources :achievements, only: :index
      end

      resources :games, only: [:index, :create, :destory, :update]

      namespace :games do
        resources :sync, controller: :sync, only: :create
      end

      resource :jobs, only: :show
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root 'home#index'
    resources :games, only: [:index, :edit, :update, :new, :create, :destroy]
  end

  unauthenticated do
    root 'welcome#index', as: :unauthenticated_root
  end
end
