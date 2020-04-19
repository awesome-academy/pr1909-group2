Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    get "static_pages/home"
    resources :users, only: [:index, :edit]
    root "books#index"
    get 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
    resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
