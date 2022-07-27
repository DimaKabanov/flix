# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: %i[new create destroy]
  get 'signin', to: 'sessions#new'

  resources :movies do
    resources :reviews
  end
end
