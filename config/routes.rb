Rails.application.routes.draw do
  devise_for :users

  resources :categories do 
    resources :tasks
  end
  
  get 'tasks', to: 'tasks#index'
  
  root "tasks#index"

end
