Rails.application.routes.draw do
  get 'discussions/index'

  root 'categories#index'
end
