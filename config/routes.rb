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
    resources :photo, only: [:index, :show, :edit, :update, :destroy]
    resources :trips do
      get :active
      get :archived
    end
  end

  resources :users do
    resources :reviews, only: [:create, :destroy]
  end

  resources :trips, only: [:index, :show, :new, :create, :destroy] do
    member do
      put :add_passenger
      put :delete_passenger
    end
  end
end
