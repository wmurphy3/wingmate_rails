Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  namespace :api do
    resources :users, only: [:index, :update, :create] do
      get 'me', on: :collection, action: :show
      collection do
        patch 'update_password'
        post 'send_recovery_email'
      end
    end

    resources :devices, only: [:index, :create]
  end

  root to: "dashboard#index"
end
