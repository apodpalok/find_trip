Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root 'main#index'
    get 'control', to: 'control#index'
  end

  root 'home#index'
  namespace :account do
    resources :profile, only: [:show, :edit]
  end
end
