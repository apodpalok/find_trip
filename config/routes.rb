Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'trips#index'

  namespace :admin do
    root 'main#index'
    get 'control', to: 'control#index'
  end

  namespace :account do
    resources :profile, only: [:show, :edit, :update]
    resources :cars
    resources :photo, only: [:show, :edit, :update, :destroy]
    resources :trips
  end

  resources :trips, only: [:index, :show, :new, :create, :destroy]
end
