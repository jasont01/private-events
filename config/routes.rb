# TODO change root to events index
Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'users#index'
  resources :users
end
