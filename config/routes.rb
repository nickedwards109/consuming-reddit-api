Rails.application.routes.draw do
  root "pages#index"
  get "reddit/callback", to: "sessions#create"
end
