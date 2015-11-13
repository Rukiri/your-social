Rails.application.routes.draw do
  resources :discussions
  get 'welcome/index'
  root 'discussions#index'
end
