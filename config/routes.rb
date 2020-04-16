Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    get "static_pages/home"
    root "static_pages#home"
    # get "/users", to: "users#index"
    # # delete "users/destroy", to: "users#destroy"
    # delete "/users/:id" => "users#destroy", as: :user
    resources :users, only: [:index, :edit]
    get 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
