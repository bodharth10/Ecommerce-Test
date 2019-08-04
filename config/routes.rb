Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  resources :products do
    collection do
      get "order_history"
    end
  end
  resources :categories
  resources :order_items, only: [:create, :update, :destroy], format: :js
  resource :cart, only: [:show]
  post 'payments/verify' => "payments#order_verification"
  resources :payments, only: [:new, :create]
  devise_scope :user do
    get '/user_profile', :to => 'registrations#show'
  end
end
