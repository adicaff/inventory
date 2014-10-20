Rails.application.routes.draw do

  root 'trends#index'
  resources :trends,   :only => [:show, :index]
  resources :hashtags, :only => [:show]
  resources :users,    :only => [:show]
  post '/share'              => 'hashtags#share',  as: :share
end