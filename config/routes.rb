Rails.application.routes.draw do
  root "causes#index"
  
  devise_for :users
  #resources :posts
  resources :favorites, only: [:index]
  resources :commitments
  resources :causes
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/:username" => "users#show", as: :user

end
