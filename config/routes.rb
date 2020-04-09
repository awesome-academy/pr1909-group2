Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    get "static_pages/home"
    root "static_pages#home"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
