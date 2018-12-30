Rails.application.routes.draw do
<<<<<<< HEAD
  namespace :user do
    get 'search/index'
    get 'results/index'
    get 'sidebar/index'
  end
=======
>>>>>>> ff0dd97c8df9e132ee0be38a32e726ad5e281e65
  scope module: :user do
    get '/search', to: 'search#index'
    get '/result', to: 'results#show'
    resources :topics, except: [:new, :edit] do
      resources :questions, except: [:new, :edit, :update] do
        resources :sources, only: [:show, :index, :new, :create, :edit, :update]
      end
    end
  end

  root 'home#index'
  get 'login', to: redirect('/auth/google_oauth2')
  get 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
