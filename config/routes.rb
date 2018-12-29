Rails.application.routes.draw do
  namespace :user do
    get 'search/index'
    get 'results/index'
  end
  scope module: :user do
    get '/search', to: 'search#index'
    resources :topics, except: [:new, :edit] do
      resources :questions, except: [:new, :edit, :update]
    end
  end

  root 'home#index'
  get 'login', to: redirect('/auth/google_oauth2')
  get 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end