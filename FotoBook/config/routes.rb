Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # devise_for :users, controllers: { registrations: 'registrations' }
  as :users do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
    get 'my_profile' => 'users#edit'
    get 'discover' => 'users#discover'
    post 'sendPic' => 'users#sendPic'
  end
  as :pages do
    get 'profile/:id', to: 'pages#edit', as: 'profile'
    # get 'discover' => 'pages#discover'
    # post 'sendPic' => 'pages#sendPic'
  end
  resources :photos
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :albums do
    resources :pictures, :only => [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  # resources :pictures
  #   as :photo do
  #   get 'newPhoto' => 'photos#new'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  # delete "deleteAlbumPicture/:id", to:"pictures#destroy", as: 'deleteAlbumPicture'
end
