Rails.application.routes.draw do

  authenticate :user, ->(u) { u.role == 'admin' } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  resources :posts do
    post '/report/:id', to: 'posts#report', as: 'report'
    resources :comments do
      resources :replies
      resources :likecs
      post '/creport/:id', to: 'comments#report', as: 'comment-report'

    end
    resources :suggestions do
      put '/approve/:id', to: 'suggestions#approve', as: 'approve'
    end
    resources :likes
  end


  devise_for :users

  get '/postss', to: 'posts#index2'

  get 'home/index'
  root to: 'home#index'

end
