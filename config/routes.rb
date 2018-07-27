Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root "posts#index"

  resources :posts do

    resources :replies
  end

  namespace :admin do
  	resources :users
  	resources :posts
  	resources :catagories
  end

end
