Rails.application.routes.draw do
  #resources :comments
  #resources :posts
  resources :posts do
    resources :comments do
      resources :likecs
    end
    resources :likes
  end


  devise_for :users

  get '/postss', to: 'posts#index2'
  post '/report', to: 'posts#report', as: 'report'

  get 'home/index'
  root to: "home#index"
  #root to: "posts#index2"
end
