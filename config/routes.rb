Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    root 'pages#home'
    get '/pages/admin'
  end

  get '/add-a-track', to: 'pages#add_a_track'
  get '/artist/:id', to: 'users#show'
  get '/show_artist/:id', to: 'users#show_artist'

  resources :tracks, only: [:index, :show]
  get '/tracks/show_track/:id' => 'tracks#show_track'
  get 's3_direct_post' => 'tracks#s3_direct_post'
  post 's3_blob_location' => 'tracks#s3_blob_location'

  resources :likes
end
