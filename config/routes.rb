Leaker::Application.routes.draw do
  root to: 'dashboards#index'

  match "/buscar/:term" => "cables#search"
  match "/buscar" => "cables#search"

  resource :dashboard
  resources :cables do
      resources :paragraphs
      resources :comments
  end
  resources :translations do
    resource :summary
  end

  namespace :backend do
    root to: 'activities#index'
    resources :activities
    resources :cables
    resources :users
    resources :translations
    resources :comments
  end

  match "/auth/:provider/callback" => "sessions#create"
  match "/logout" => "sessions#destroy", :as => :logout
  match "/entrar" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter" if Rails.env.development?
end

