Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "sign_in/:provider" => "oauths#oauth", as: 'auth_at_provider'
  delete 'sign_out' => 'user_sessions#destroy'

  get 'landing' => 'pages#show', id: 'landing'
  get '/wikis' => 'wikis#index', as: 'wiki_index'
  get '/:id' => 'wikis#show', as: 'wiki'
  put '/:id' => 'wikis#update', as: 'edit_wiki'
  post '/new' => 'wikis#new', as: 'new_wiki'
  delete '/:id' => 'wikis#destroy', as: 'delete_wiki'
  get '/:wiki_id/pages/:id' => 'pages#show', as: 'wiki_page'
  put '/:wiki_id/pages/:id' => 'pages#update', as: 'edit_wiki_page'
  post '/:wiki_id/pages/new' => 'pages#new', as: 'new_wiki_page'
  delete '/:wiki_id/pages/:id' => 'pages#destroy', as: 'delete_wiki_page'

  get '/' => 'users#show', as: 'user'
  root 'pages#show', id: 'landing'

  resources :user, only: [:edit]
end
