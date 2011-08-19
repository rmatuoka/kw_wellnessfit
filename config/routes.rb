KwWellnessfit::Application.routes.draw do

  get "cases/index"

  get "cases/show"

 resources :home
 resources :ciafisio
 resources :about
 
 root :to => "home#index"
end
