Rails.application.routes.draw do

  post 'guest_login' => "guest_user#login"

  post 'logout' => "users#logout"

  get 'login' => "users#login_form"
  post 'login' => "users#login"

  get 'users/index' => "users#index"
  get 'users/new' => "users#new"
  post 'users/create' => "users#create"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  post 'users/:id/delete' => "users#delete"
  get 'users/:id' => "users#show"

  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/:id' => "posts#show"
  post 'posts/create' => "posts#create"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/delete' => "posts#delete"

  get '/' => "home#top"
  get '/about' => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
