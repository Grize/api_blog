Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :posts,    only:    :create
      resources :top_post, only:    :index
      resources :rates,    only:    :update
      resources :users_ip, only:    :index
    end
  end
end
