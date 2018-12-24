Rails.application.routes.draw do
  namespace :user do
    get 'search/index'
  end
  scope module: :user do
    get '/search', to: 'search#index'
    resources :topics, except: [:new, :edit] do
      resources :questions, only: [:show, :index, :create]
    end
  end

  root 'home#index'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
