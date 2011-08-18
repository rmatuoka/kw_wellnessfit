KwWellnessfit::Application.routes.draw do
  get "ciafisio/index"

  get "ciafisio/show"

  get "about/index"

 resources :home
 
 root :to => "home#index"
end
