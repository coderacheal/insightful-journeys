Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#show'

  get '/about', to: 'users#about'
  get '/contact', to: 'users#contact'

  resources :users
  get '/path', to: 'controller#action'

end
