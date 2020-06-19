Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :players
  resources :teams
end
