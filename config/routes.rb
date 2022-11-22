Rails.application.routes.draw do
  resources :messages, except: [:new, :create, :index]
  root to: "pages#home"

  devise_for :users
  resources :users do
    resources :gears, only: [:new, :create]
    resources :messages, only: [:new, :create, :index]
    resources :rentals, only: [:index]
  end
  resources :gears, only: :show
  resources :gears, only: :index do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:destroy, :edit, :update]
end
