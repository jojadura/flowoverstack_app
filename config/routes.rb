Rails.application.routes.draw do
  
  root 'questions#index'

  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
  end

  devise_for :users
end
