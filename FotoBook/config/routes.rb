Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'
  as :users do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end
  as :pages do
    get 'myProfile' => 'pages#edit'
  end
  resources :photos
  resources :users
  #   as :photo do
  #   get 'newPhoto' => 'photos#new'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
