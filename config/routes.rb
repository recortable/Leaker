Leaker::Application.routes.draw do
  root to: 'client#show'

  resources :translations

  namespace :backend do
    root to: 'users#index'
    resources :users
    resources :translations
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end

