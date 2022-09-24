Rails.application.routes.draw do

  resources :categories
  resources :tasks
  root "categories#index"
end
