Rails.application.routes.draw do

  scope module: :user do
    get  '/search',  to: 'search#index'
    get  '/source',  to: 'sources#show'
    post '/source',  to: 'sources#create'
    get  '/sidebar', to: 'sources/sidebar#show'
    
    resources :topics, except: [:new, :edit] do
      resources :questions, except: [:new, :edit, :update, :destroy]
    end
    resources :questions, only: [:destroy] do
      resource :sources, only: [:show, :index, :create]
    end
  end

  root 'home#index'
  get 'login', to: redirect('/auth/google_oauth2')
  get 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
