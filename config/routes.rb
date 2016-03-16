Rails.application.routes.draw do
  
  root 'questions#index'

  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    post 'votes', to: 'votes#create', as: 'votes'
    delete 'votes', to: 'votes#destroy', as: 'votes_del'
  end

  post 'votes/:answer_id', to: 'votes#create', as: 'votes_answer'  
  delete 'votes/:answer_id', to: 'votes#destroy', as: 'votes_answer_del'

  post 'comments/:answer_id', to: 'comments#create', as: 'answer_comments'  

  devise_for :users
end
