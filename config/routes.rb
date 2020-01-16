Rails.application.routes.draw do
   root to: 'employees#index'
   resources :employees do
     resources :divisions
     resources :projects
   end
     end
   
