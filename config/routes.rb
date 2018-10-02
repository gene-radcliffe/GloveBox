Rails.application.routes.draw do

  get 'welcome/home'
  get 'users/show', to: 'users#show'
  root 'welcome#home'
  devise_for :users
  resources :vehicles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
