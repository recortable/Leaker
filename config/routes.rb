Leaker::Application.routes.draw do
  root to: 'client#show'

  namespace :backend do
    root to: 'users#index'
    resources :users
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end

