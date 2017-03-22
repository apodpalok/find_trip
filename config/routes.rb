Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root 'main#index'
    get 'control', to: 'control#index'
  end

  root 'home#index'
  resources :trips, only: [:index, :show, :new, :create, :destroy]
  get 'account/:id', to: 'account#show', as: 'account'
end
