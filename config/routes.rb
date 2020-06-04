# TODO change root to events index
Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
end
