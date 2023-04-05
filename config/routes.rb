Rails.application.routes.draw do
  get 'sessions/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :reimbusements, path: '/reimbursements', only: %i[ index show create update destroy ]
  # Defines the root path route ("/")
  # root "articles#index"
  post 'auth/login', to: 'sessions#create'
end
