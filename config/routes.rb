Rails.application.routes.draw do
  resources :meals, only: [:index, :show] do
    resources :reviews, only: [:create, :update]
  end
  
  namespace :admin do
    resources :users
    resources :meals
    resources :reviews

    root to: "users#index"
  end

  devise_for :users
end
