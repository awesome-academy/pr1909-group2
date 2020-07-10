Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :players
  resources :teams
  resources :users
  scope '/:locale', locale: Regexp.new(I18n.available_locales.join('|')) do
  end
  resources :tournaments
  resources :teams
  resources :players
  namespace :admin do
    get "/", to: "base#index"
    resources :users
    resources :players
    resources :teams
    resources :tournaments
    devise_scope :user do
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      get "/logout", to: "sessions#destroy"
    end
  end
end
