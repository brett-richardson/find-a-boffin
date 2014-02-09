ExpertSearch::Application.routes.draw do

  resources :members do
    resources :friendships, only: [ :new, :create ]
    resources :connections, only: [ :new, :index  ]
  end

  root to: 'pages#home'

end
