Rails.application.routes.draw do
  resources :categories
  get 'super/index'

  resources :posts
  resources :topics
  resources :forums
  get 'discussions/index'

  resources :discussions
  root 'forums#index'
end
