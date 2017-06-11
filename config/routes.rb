Rails.application.routes.draw do
  devise_for :users
  root to: "obituaries#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :obituaries
  resources :comments
end
