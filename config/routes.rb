# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if defined?(Sidekiq::Web)
  resources :users do
    collection do
      get 'search', to: 'users#search'
    end
  end
  resources :roles do
    collection do
      get 'search', to: 'roles#search'
    end
  end
  post 'login', to: 'auth#login'

  resources :events do
  end
  resources :programs do
    collection do
      get 'active_programs', to: 'programs#active_programs'
    end
  end
end
