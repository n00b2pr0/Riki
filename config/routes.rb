Riki::Application.routes.draw do
  
  resources :pages
  
  get "page/:id/history" => "pages#history", :as => "history"
  get "page/:id/revert" => "pages#revert", :as => "revert_page"
  
  root :to => "pages#index"

end
