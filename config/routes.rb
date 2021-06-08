Rails.application.routes.draw do
  root "causes#index"
  
  
  resources :posts
  resources :favorites
  resources :commitments
  resources :causes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

end
