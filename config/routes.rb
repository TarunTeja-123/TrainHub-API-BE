# frozen_string_literal: true

Rails.application.routes.draw do
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

  resources :events do
  end
end
