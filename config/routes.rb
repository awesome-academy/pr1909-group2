Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :players
  resources :teams
  scope '/:locale', locale: Regexp.new(I18n.available_locales.join('|')) do
    devise_for :users, skip: :omniauth_callbacks
  end
  resources :tournaments 
end
