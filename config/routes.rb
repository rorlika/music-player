Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :update, :edit, :show ] do
  member do
    get :activate
  end
end
  resources :sessions
  resources :songs
  resource :favorite, only: [ :create, :destroy ]
  
  root 'songs#index'
  get 'home' , to: 'songs#index' , as: :home
  get 'login', to: 'sessions#new', as: :login
  get 'signup', to: 'users#new', as: :signup
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'test' , to: 'songs#test', as: :test
  get 'language', to: 'users#language', as: :set_locale
end
