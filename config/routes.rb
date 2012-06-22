Riki::Application.routes.draw do
  resources :categories

  resources :pages
  resources :identities

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  match "history/:id" => "pages#history", :as => "history"
  post "history/:id/revert" => "history#revert", :as => "revert_history"

  root :to => "sessions#new"
end