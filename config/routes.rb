Rails.application.routes.draw do
  root "pages#index"
  get "reddit/callback", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  get "subreddits", to: "subreddits#show"
end
