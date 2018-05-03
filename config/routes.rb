Rails.application.routes.draw do
  get 'braintree/new'
  post 'braintree/checkout'

  get 'welcome/index'

  resources :listings do 
    member do 
        get 'verify'
    end

    resources :reservations, only: [:create, :new]
  end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create,:edit, :update] do 
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

# resources :reservations, controller:"reservations_controller"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:"welcome#index"
  get 'about' => 'home#about', as: 'about'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
