Rails.application.routes.draw do


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'reimbursements', to: 'reimbursements#index'
  post 'users', to: 'users#create'
  post 'reimbursements/new', to: 'reimbursements#create'
  get 'reimbursements', to: 'reimbursements#show'
  #get 'reimbursements/all/:id', to: 'reimbursements#show_all'
  put 'reimbursements', to: 'reimbursements#update'
  #patch 'reimbursements/:id', to: 'reimbursements#update'
  delete 'reimbursements/:id', to: 'reimbursements#delete'
  #resources :reimbusements, path: '/reimbursements', only: %i[ index show update destroy ]
  # Defines the root path route ("/")
  # root "articles#index"
  post 'auth/login', to: 'sessions#create'
end
