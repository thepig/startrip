Startrip::Application.routes.draw do
  devise_for :users, path_names: { sign_in: 'signin', sign_out: 'signout', sign_up: 'signup' }
end