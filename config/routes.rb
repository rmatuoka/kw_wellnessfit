KwWellnessfit::Application.routes.draw do

  get "news/index"

  get "news/show"

  get "labors/index"

  get "hints/index"

  get "hints/show"

  get "contacts/new"

  get "contacts/index"

  get "contacts/show"

  get "contacts/create"

  get "clients/index"


 resources :home
 resources :ciafisio
 resources :about
 
 root :to => "home#index"
end
