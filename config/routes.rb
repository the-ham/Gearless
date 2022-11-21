Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  resources :users do
    resources :gears, only: [:new, :create]
  end
  resources :gears, only: :index
end
