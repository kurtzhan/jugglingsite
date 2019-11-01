Rails.application.routes.draw do
  get 'gunswap/animator'

  mount Ckeditor::Engine => '/ckeditor'
  # Back admin routes start
  namespace :admin do
    resources :users
    resources :jugglers
    resources :categories
    resources :articles
    resources :books

    # Admin root
    root to: 'application#index'
  end
  # Back admin routes end

  # Front routes start
  resources :articles, :only => [:show, :index]
  resources :books, :only => [:show, :index]
  resources :categories, :only => [:show]
  devise_for :users, only: [:session, :registration], path: 'session',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Application root
  root to: 'application#home'
  resources :tags, :only => [:index]
  get '/juggling_lab' => 'juggling_lab#index', as: :juggling_lab
  post '/juggling_lab/generate_gif', to: "juggling_lab#generate_gif"
  # Front routes end
end
