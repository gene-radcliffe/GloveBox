Rails.application.routes.draw do
 
  get 'reminders/oilchange'
  resources :reminders
  get 'notifications/reminder'
  #devise_for :users
  
  get 'welcome/home', to: 'welcome#home'
  #root to: 'welcome#home'
  
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :maintenance_actions
  
  resources :users, only: :show
  resources :vehicles do
  resources :maintenance_actions 
  end


  get "maintenance_actions/reminder", to: "maintenance_actions#reminder"
  resources :vehicles do
    resources :receipts
    resources :maintenance_logs do
      
      resources :maintenance_actions 
    end
      
  end
     


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
