Rails.application.routes.draw do

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }

  devise_scope :user do
    get '/users/logout' => 'devise/sessions#destroy'
  end

  root to: "posts#index"

  get  'contact' => 'contact#index'
  post  'contact/confirm' => 'contact#confirm'
  post  'contact/thanks' => 'contact#thanks'

  post 'likes/:post_id/create'  => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  get  'login'             => 'users#login_form'
  post 'login'             => 'users#login'
  post 'logout'            => 'users#logout'

  post 'users/:id/update'  => 'users#update', as: 'users_update'
  get  'users/:id/edit'    => 'users#edit', as: 'users_edit'
  # post 'users/create'      => 'users#create'
  # get  'users/new'         => 'users#new'
  get  'users/:id'         => 'users#show'
  get  'users/thanks'      => 'users#thanks'


  get  'posts/index'       => 'posts#index'
  get  'posts/:id/index'   => 'posts#personal_index'
  get  'posts/:id/likes'   => 'posts#likes'
  get  'posts/new'         => 'posts#new'
  get  'posts/:id'         => 'posts#show', as: 'posts_show'
  post 'posts/create'      => 'posts#create'
  get  'posts/:id/edit'    => 'posts#edit'
  post 'posts/:id/update'  => 'posts#update', as: 'posts_update'
  post 'posts/:id/destroy' => 'posts#destroy'


  get  'top'               => 'home#top', as: 'top'
  get  'about'             => 'home#about'

  get  'thanks'            => 'home#thanks'

end
