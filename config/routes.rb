Rails.application.routes.draw do
  root "causes#index"
  
  devise_for :users
  resources :posts
  resources :favorites
  resources :commitments, only: [:index, :show, :update, :edit, :new]
  resources :causes
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/:username" => "users#show", as: :user

end
