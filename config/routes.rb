Rails.application.routes.draw do
  
  get 'rooms/index'
  get 'rooms/show'
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  
  get    '/signup',  to: 'users#new'
  get "users/:id/likes" => "users#likes"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" =>"posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  

  root "home#top"
  get "about"=> "home#about"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  get 'message/:id' => 'messages#show', as: 'message'
  resources :messages, only: [:create]
end
