Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :meals
      resources :reviews

      root to: "users#index"
    end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
