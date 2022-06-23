Rails.application.routes.draw do
  resources :replies

  authenticate :user, ->(u) { u.role == 'admin' } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  # resources :suggestions
  # resources :comments
  # resources :posts
  resources :posts do
    resources :comments do
      resources :likecs
      #resources :replies, module: :comments
    end
    resources :suggestions do
      put '/approve/:id', to: 'suggestions#approve', as: 'approve'
      #put '/approve/:id', to: 'posts#approve', as: 'approve'
      #resources :replies, module: :suggestions
    end
    resources :likes
  end

  resources :comments do
    resources :replies
  end


  devise_for :users

  get '/postss', to: 'posts#index2'
  post '/report/:id', to: 'posts#report', as: 'report'
  post '/creport/:id', to: 'comments#report', as: 'comment-report'
  put '/approve/:id', to: 'suggestions#approve', as: 'approve'

  get 'home/index'
  root to: 'home#index'
  # root to: "posts#index2"
end
