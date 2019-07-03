Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'
  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end
  as :page do
    get 'myProfile' => 'pages#edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
