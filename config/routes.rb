KwWellnessfit::Application.routes.draw do

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
 resources :cases
 resources :works
 resources :links
 
 resources :user_sessions
 resources :users
 resources :password_resets
 resources :atualizar
 
 #Inicio do namespace Admin
 namespace(:admin){
   resources :companies
   resources :static_contents
   resources :users do
     collection do
       get 'search'
     end
   end
   
   root :to => "static_contents#index"
 }
 #Final do namespace Admin
 
 root :to => "home#index"
 
 match 'cadastro' => "users#new"
 match 'login' => 'user_sessions#new'  
 match 'logout' => 'user_sessions#destroy'
 
end
