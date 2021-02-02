Rails.application.routes.draw do
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "signup" => "users#new"
  get "users/:id/likes" => "users#likes"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" =>"posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  root "home#top"
  get "about"=> "home#about"
  resources :users
  resources :account_activations, only: [:edit]
end
