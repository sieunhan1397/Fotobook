Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # devise_for :users, controllers: { registrations: 'registrations' }
  as :users do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end
  as :pages do
    get 'myProfile' => 'pages#edit'
    get 'discover' => 'pages#discover'
  end
  resources :photos
  resources :users
  resources :albums do
    resources :pictures, :only => [:create, :destroy]
  end
  # resources :pictures
  #   as :photo do
  #   get 'newPhoto' => 'photos#new'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  # delete "deleteAlbumPicture/:id", to:"pictures#destroy", as: 'deleteAlbumPicture'
end
