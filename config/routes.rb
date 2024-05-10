Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  get  "/base_info", to: "static_pages#base_info"
  get  "/hobby", to: "static_pages#hobby"

  get  "/signup",  to: "users#new"
  resources :users do
    member do
      get :active_likes, :passive_likes
     #get :following,    :followers
      get :match
    end
  end

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :likes, only: [:index, :create, :destroy, :match]
  resources :rooms, only: [:index, :show]
  resources :chats, only: [:show, :create]
end
