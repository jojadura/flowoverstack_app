Rails.application.routes.draw do
  
  root 'questions#index'

  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    post 'votes', to: 'votes#create', as: 'votes'
  end

  post 'votes/:id', to: 'votes#create', as: 'votes_answer'  

  devise_for :users
end
