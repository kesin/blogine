Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  # Blog Area
  #
  resources :posts, path: :blog, except: [:index]
  resources :tags
  resources :columns

  #
  # Admin Area
  #
  namespace :admin do
    root to: "dashboard#index"
  end

  #
  # User Area
  #
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root to: 'posts#index'

end
