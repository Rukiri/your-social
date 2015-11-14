Rails.application.routes.draw do
  resources :posts
  resources :topics
  resources :forums
  resources :categories
  get 'discussions/index'

  resources :discussions
  root 'welcome#index'
end
