# frozen_string_literal: true

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.role == 'admin' } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  resources :posts do
    post '/report/:id', to: 'posts#report', as: 'report'
    resources :comments do
      resources :replies
      resources :likes
      post '/creport/:id', to: 'comments#report', as: 'comment-report'
    end
    resources :suggestions do
      put '/approve/:id', to: 'suggestions#approve', as: 'approve'
      resources :replies
    end
    resources :likes
  end

  devise_for :users

  get '/publish_posts', to: 'posts#index2'
  get '/not_found', to: 'posts#error'

  get 'home/index'
  root to: 'home#index'
end
