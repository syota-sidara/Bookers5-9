Rails.application.routes.draw do
  

  get 'users/show'
  get 'users/index'
  get 'users/edit'
  devise_for :users
  resources :users, only: [:show,:edit,:update,:index,:create]

 
  resources :books, only: [:create,:index,:show,:edit,:update,:destroy]

  root 'home#top'

  get 'home/about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
