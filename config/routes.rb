Rails.application.routes.draw do

  authenticate :user, ->(u) { u.role == 'admin' } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  resources :posts do
    post '/report/:id', to: 'posts#report', as: 'report'
    resources :comments do
      post '/creport/:id', to: 'comments#report', as: 'comment-report'
      resources :likecs
    end
    resources :suggestions do
      put '/approve/:id', to: 'suggestions#approve', as: 'approve'
    end
    resources :likes
  end

  #resources :comments do
  #  resources :replies
  #end

  resources :comments do
    resources :replies, module: :comments
  end

  resources :suggestions do
    resources :replies, module: :suggestions
  end


  devise_for :users

  get '/postss', to: 'posts#index2'

  get 'home/index'
  root to: 'home#index'
  # root to: "posts#index2"
end
