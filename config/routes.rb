Rails.application.routes.draw do

  devise_for :user
  root 'items#index'
  resources :items

end