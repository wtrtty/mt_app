Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"

  get  "/signup",  to: "users#new"
  resources :users do
    member do
      get :active_likes, :passive_likes
      #get :following, :followers
    end
  end

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :likes, only: [:index, :create, :destroy]
  resources :chat_rooms, only: [:index, :show]
  resources :messages, only: [:create]
end
