Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope '/:locale', locale: Regexp.new(I18n.available_locales.join('|')) do
    devise_for :users, skip: :omniauth_callbacks
  end
  resources :tournaments
  resources :teams
  resources :players
  namespace :admin do
    get "/", to: "base#index"
    resources :users
    resources :players
    resources :teams
    devise_scope :user do
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      get "/logout", to: "sessions#destroy"
    end
  end
end
