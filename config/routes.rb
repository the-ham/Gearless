Rails.application.routes.draw do
  resources :messages, except: [:new, :create, :index]
  root to: "pages#home"

  devise_for :users
  resources :users do
    resources :gears, only: [:new, :create]
    resources :messages, only: [:new, :create, :index]
    resources :rentals, only: [:index] do
      resources :reviews, only: %i[new create]
    end
  end
  resources :reviews, only: [:destroy, :edit, :update]

  get '/users/:id/host_show', to: 'rentals#host_show', as: :host_show

  resources :gears, only: :show
  resources :gears, only: :index do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:destroy, :edit, :update]

end
