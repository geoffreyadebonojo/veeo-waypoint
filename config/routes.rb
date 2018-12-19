Rails.application.routes.draw do
  namespace :user do
    get 'topics/create'
    get 'topics/index'
    get 'topics/show'
  end

  
  root 'home#index'
  get '/dashboard', to: 'user/topics#index'

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
