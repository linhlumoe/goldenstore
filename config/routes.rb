Rails.application.routes.draw do

  resources :categories

  resources :products

  get '/cart', to: 'cart#show', as: 'cart'

  get '/show_by_user', to: 'orders#show_by_user', as: 'show_orders_by_user'

  resources :order_items, only: [:create, :update, :destroy]

  resources :charges, only: [:new, :create]

  resources :orders

  devise_for :users, :controllers => { registrations: 'registrations' }

  match '/contacts', to: 'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create]
  authenticate :user, lambda { |user| user.admin? } do
    mount Blazer::Engine, at: "monitoring"
  end

  mount RailsDb::Engine => '/db', :as => 'db'
  root 'home#index'
end
