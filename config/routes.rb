Riki::Application.routes.draw do
  resources :pages
  match "history/:id" => "pages#history", :as => "history"
  post "history/:id/revert" => "history#revert", :as => "revert_history"
  root :to => "pages#index"
end
