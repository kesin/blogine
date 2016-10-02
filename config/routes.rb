Rails.application.routes.draw do
  get 'sessions/new,'

  get 'sessions/create,'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'

  resources :posts, path: :blog, except: [:index]

end
