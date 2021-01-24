Rails.application.routes.draw do

  devise_for :users
  root to: "home#top"

  post 'likes/:post_id/create'  => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  get  'login'             => 'users#login_form'
  post 'login'             => 'users#login'
  post 'logout'            => 'users#logout'

  post 'users/:id/update'  => 'users#update'
  get  'users/:id/edit'    => 'users#edit'
  post 'users/create'      => 'users#create'
  get  'users/new'         => 'users#new'
  get  'users/:id'         => 'users#show'


  get  'posts/index'       => 'posts#index'
  get  'posts/:id/index'   => 'posts#personal_index'
  get  'posts/:id/likes'   => 'posts#likes'
  get  'posts/new'         => 'posts#new'
  get  'posts/:id'         => 'posts#show'
  post 'posts/create'      => 'posts#create'
  get  'posts/:id/edit'    => 'posts#edit'
  post 'posts/:id/update'  => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'


  get  'home#top'                 => 'home#top'
  get  'about'             => 'home#about'

end
