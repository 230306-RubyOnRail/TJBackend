Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :reimbusements, path: '/reimbursements', only: %i[ index view_all view_one create update update_status destroy ]
  # Defines the root path route ("/")
  # root "articles#index"
  post 'auth/login', to: 'sessions#create'
end
