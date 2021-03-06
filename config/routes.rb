Startrip::Application.routes.draw do
  resources :posts, only: [:index]

  devise_for :users, path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }

  namespace :api do
    namespace :v1 do
      get 'users/:username', to: 'users#show', as: :user

      resources :authentications, only: [:create]
      resources :posts, only: [:create, :index]
    end
  end
end
