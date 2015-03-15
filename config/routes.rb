Rails.application.routes.draw do
  root 'users#index'
  get 'sign-in', to: 'authentication#new'
  post 'sign-in', to: 'authentication#create'
  get 'sign-up', to: 'users#new'
  post 'sign-up', to: 'users#create'
  get 'sign-out', to: 'authentication#destroy'

  resources :users, only: [] do
    resources :posts, only: [:new, :create, :show, :index]
  end
end
