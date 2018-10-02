Rails.application.routes.draw do

  #devise_for :users

  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root to: 'welcome#home'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    # devise_for :users, controllers: {
    #   sessions: 'users/sessions',
    #   registrations: 'users/registrations',
    #   passwords: 'users/passwords'
    # }
  #, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  

  #
end
