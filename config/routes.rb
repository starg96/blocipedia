Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  resources :charges, only: [:new, :create, :index]

  resources :wikis
  resources :users, only: [:show, :index]
  resources :downgrades, only: :create

  root to: 'welcome#index'
end
