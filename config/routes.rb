Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :random do
        resources :games, only: :index

        resources :steam, param: :appid, only: [] do
          resource :achievement, only: :show
        end
      end

      resources :games, only: :index

      namespace :games do
        resource :sync, controller: :sync, only: :create
      end

      resources :jobs, only: :show
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
