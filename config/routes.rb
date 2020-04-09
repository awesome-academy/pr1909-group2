Rails.application.routes.draw do
  devise_for :users
  get "static_pages/home"
  root "static_pages#home"
  # get '/users/sign_out' => 'devise/sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
