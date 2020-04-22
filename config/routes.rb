Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, :path_prefix => 'd'
    get "static_pages/home"
    resources :users, :only => [:index, :edit, :show]
    root "books#index"
    delete 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
    match '/users/:id', to: 'users#show', via: 'get'
    resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
