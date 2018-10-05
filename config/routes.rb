Rails.application.routes.draw do
  #devise_for :users
  
  get 'welcome/home', to: 'welcome#home'
  #root to: 'welcome#home'
  
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :maintenance_actions do
   
  end

  resources :vehicles do
    resources :maintenance_logs do
      get "oilchange" , to: 'maintenance_logs#oilchange'
      get "brakechange", to: 'maintenance_logs#breakchange'
    end
      
  end
     


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end
