Leaker::Application.routes.draw do
  root to: 'cables#index'

  match "/buscar/:term" => "cables#search"
  match "/buscar" => "cables#search"
  resources :cables
  resources :translations

  namespace :backend do
    root to: 'users#index'
    resources :users
    resources :translations
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end

