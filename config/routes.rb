Rails.application.routes.draw do
  scope module: :user do
    resources :topics, only: [:show, :index, :create] do
      resources :questions, only: [:show, :index, :create]
    end
  end

  root 'home#index'

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
