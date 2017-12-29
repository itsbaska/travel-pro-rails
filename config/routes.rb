Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign_up', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :trips do
    resources :flights
    resources :receipts, only: [:index, :new, :create]
    resources :travelgroupings, only: [:new, :create]
  end

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/users/:id/dashboards", to: "dashboards#show", as: 'user_dashboard'

end
