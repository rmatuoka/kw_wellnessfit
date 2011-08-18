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

  get "ciafisio/index"

  get "ciafisio/show"

  get "about/index"

 resources :home
 
 root :to => "home#index"
end
