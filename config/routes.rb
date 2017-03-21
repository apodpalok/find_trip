Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root 'pages#index'
  end

  root 'home#index'
  get 'account/:id', to: 'account#show', as: 'account'
end
