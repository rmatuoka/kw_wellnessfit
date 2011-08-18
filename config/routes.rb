KwWellnessfit::Application.routes.draw do

 resources :home
 resources :ciafisio
 resources :about
 
 root :to => "home#index"
end
