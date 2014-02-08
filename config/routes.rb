ExpertSearch::Application.routes.draw do

  resources :members do
    resources :friendships, only: [ :new, :create ]
  end

  root to: 'pages#home'

end
