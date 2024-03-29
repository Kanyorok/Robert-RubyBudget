Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  devise_for :users

  authenticated :user do
    root "home#index", as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root "splash#index", as: :unauthenticated_root
    end
  end

  resources :group_transactions do
    resources :money_transactions, only: [:create, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end