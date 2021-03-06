Rails.application.routes.draw do
  get 'home/', to: "home#new"
  get 'home/feedback', to: "home#feedback"
  get 'home/recommend', to: "home#recommend"
  put "home/recommend", to: "home#recommend"
  get 'home/recommendee', to: "home#recommendee"
  get 'sessions/create'
  get 'welcome/index'
  get "/login", to: redirect("/auth/google_oauth2")
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get '/dummypath/create', to: "home#dum_create"
  get '/leaderboard', to: "home#leaderboard"

  resource :session, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
