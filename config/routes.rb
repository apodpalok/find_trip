Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  get 'account/:id', to: 'account#show', as: 'account'
end
