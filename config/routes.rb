Rails.application.routes.draw do
  get 'discussions/index'

  resources :discussions
  root 'welcome#index'
end
