Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, class_name: 'User', controllers: { registrations: 'users/registrations'}

  root 'home#index'

  namespace :account do
    resource :profile, except: [:new]
    resources :cars
    resource :photo, only: [:edit, :update, :destroy]
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
