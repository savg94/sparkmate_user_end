Rails.application.routes.draw do
  root :to => "requests#index"
  resources :chats
  resources :gigs
  resources :providers
  resources :add_on_services
  resources :requests
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
