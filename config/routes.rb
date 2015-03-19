Rails.application.routes.draw do
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "sign_in/:provider" => "oauths#oauth", as: 'auth_at_provider'
  post 'sign_out' => 'user_sessions#destroy'

  get '/:id' => 'wikis#show', as: 'wiki'
  get '/:wiki_id/pages/:id' => 'pages#show', as: 'wiki_page'

  get '/' => 'wikis#show', id: 'home', constraints: RouteConstraints::UserRequiredConstraint.new
  root 'pages#show', id: 'landing'
end
