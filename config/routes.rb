Rails.application.routes.draw do
  get "/landing" => "welcome#show", id: "landing"
  get "/premium" => "charges#new"
  post "/premium" => "charges#create"

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "sign_in/:provider" => "oauths#oauth", as: "auth_at_provider"
  delete "sign_out" => "user_sessions#destroy"

  resources :users, only: [:show, :edit]

  resources :wikis, only: [:create, :index]
  resources :wikis, path: "", only: [:show, :update, :destroy] do
    resources :pages, only: [:create, :show, :update, :destroy]
  end

  root "welcome#show"
end
