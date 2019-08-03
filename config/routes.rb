Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'menus/batch' => 'menus#batch_registration'
  post 'menus/batch' => 'menus#batch_create'
  resources :menus
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'
  devise_for :users
end
