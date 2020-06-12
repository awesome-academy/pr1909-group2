Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  get 'pages/index'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
