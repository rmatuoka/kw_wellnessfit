KwWellnessfit::Application.routes.draw do

  get "works/new"

  get "works/index"

  get "works/show"

  post "works/create"

  get "news/index"

  get "news/show"

  get "labors/index"

  get "hints/index"

  get "hints/show"

  get "contacts/new"

  get "contacts/index"

  get "contacts/show"

  post "contacts/create"

  get "clients/index"

  get "cases/index"

  get "cases/show"

 resources :home
 resources :ciafisio
 resources :about
 resources:cases
 
 root :to => "home#index"
end
