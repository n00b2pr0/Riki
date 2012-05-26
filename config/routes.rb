Riki::Application.routes.draw do
  resources :pages
  post "history/:id/revert" => "history#revert", :as => "revert_history"
  root :to => "pages#index"
end
