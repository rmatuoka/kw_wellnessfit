KwWellnessfit::Application.routes.draw do
  get "about/index"

 resources :home
 
 root :to => "home#index"
end
