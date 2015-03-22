Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "sign_in/:provider" => "oauths#oauth", as: 'auth_at_provider'
  post 'sign_out' => 'user_sessions#destroy'

  get 'landing' => 'pages#show', id: 'landing'
  get '/:id' => 'wikis#show', as: 'wiki'
  put '/:id' => 'wikis#update', as: 'edit_wiki'
  post '/new' => 'wikis#new', as: 'new_wiki'
  get '/:wiki_id/pages/:id' => 'pages#show', as: 'wiki_page'
  put '/:wiki_id/pages/:id' => 'pages#update', as: 'edit_wiki_page'
  post '/:wiki_id/pages/new' => 'pages#new', as: 'new_wiki_page'

  get '/' => 'users#show', constraints: RouteConstraints::UserRequiredConstraint.new
  root 'pages#show', id: 'landing'

  resources :user, only: [:edit]
end
