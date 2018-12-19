Rails.application.routes.draw do
  namespace :user do
    get 'topics/create'
    get 'topics/index'
    get 'topics/show'
  end
  get 'topics/create'
  get 'topics/index'
  get 'topics/show'
  get '/dashboard', to: 'user/topics#index'

  # get '/dashboard', to: "user/topics#index"
end
