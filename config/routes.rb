Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # rucaptcha
  mount RuCaptcha::Engine => "/rucaptcha"

  #
  # Upload Area
  #

  post 'image' => 'upload#upload_image'
  post 'image_base64' => 'upload#upload_base64_image'
  post 'upload_avatar' => 'upload#upload_avatar'

  #
  # Blog Area
  #
  resources :posts, path: :blog, except: [:index] do
    resources :comments, only: [:create]
  end
  resources :tags, only: [:index, :show]
  resources :columns, only: [:index, :show]

  #
  # Search
  #

  get 'search' => 'search#search'

  #
  # Admin Area
  #
  namespace :admin do
    root to: "dashboard#index"
    resources :posts
    resources :comments, only: [:index, :create, :update, :destroy]
    resources :columns, except: [:update] do
      collection do
        put :update_column
      end
    end
    resources :tags, except: [:update] do
      collection do
        put :update_tag
      end
    end
    resources :pages
    resource :settings, only: [:show, :create]
  end

  #
  # User Area
  #
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root to: 'posts#index'

  #
  # Page Area
  #
  resources :pages, only: [:show], path: "/" do
    resources :comments, only: [:create]
  end

end
