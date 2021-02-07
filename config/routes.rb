Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books
  resources :users, only: [:show, :edit, :create]
end
