Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  resources :users do
    resources :gears, only: [:new, :create]
  end
  resources :gears, only: :index do
    resources :rentals, only: [:new, :create, :edit, :update]
  end
  resources :rentals, only: [:destroy, :index]
end
