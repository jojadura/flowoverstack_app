Rails.application.routes.draw do
  
  root 'questions#index'

  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    post 'votes', to: 'votes#create', as: 'votes'
    delete 'votes', to: 'votes#destroy', as: 'votes_del'
  end

  post 'votes/:id', to: 'votes#create', as: 'votes_answer'  

  devise_for :users
end
