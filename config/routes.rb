Rails.application.routes.draw do
  get 'home/', to: "home#new"
  get 'sessions/create'
  get 'welcome/index'
  get "/login", to: redirect("/auth/google_oauth2")
  get "/auth/google_oauth2/callback", to: "sessions#create"

  resource :session, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
