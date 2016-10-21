Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, path: :blog, except: [:index]
  resources :tags
  resources :columns

  #
  # Admin Area
  #
  namespace :admin do
    root to: "dashboard#index"
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
