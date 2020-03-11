Rails.application.routes.draw do
  
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  #get 'users/new'
  #get 'users/create'
  #get 'toppages/index'
  
  root to: 'tasks#index'
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  
  get 'signup' , to: 'users#new'
  
  resources :users , only: [ :create]
  
  resources :tasks

end
