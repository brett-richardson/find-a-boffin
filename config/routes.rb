ExpertSearch::Application.routes.draw do
  resources :members

  root to: 'pages#home'
end
