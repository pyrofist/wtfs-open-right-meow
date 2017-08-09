Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :locations, except: [:edit, :update, :destroy]

  root to: "locations#index"
end
