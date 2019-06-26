Rails.application.routes.draw do
  resources :albums
  resources :photos
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#signup'
end
