Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.id == 3 } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  #resources :suggestions
  #resources :comments
  #resources :posts
  resources :posts do
    resources :comments do
      resources :likecs
    end
    resources :suggestions
    resources :likes
  end


  devise_for :users

  get '/postss', to: 'posts#index2'
  get '/report', to: 'posts#report', as: 'report'
  post '/creport', to: 'comments#report', as: 'comment-report'
  get '/approve', to: 'posts#approve', as: 'approve'

  get 'home/index'
  root to: "home#index"
  #root to: "posts#index2"


end
