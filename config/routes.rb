Rails.application.routes.draw do
  resources :menus
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'
  devise_for :users
end
