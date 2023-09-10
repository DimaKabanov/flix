# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  resources :genres

  resources :movies do
    resources :reviews
    resources :favorites, only: %i[create destroy]
  end

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: %i[new create destroy]
  get 'signin', to: 'sessions#new'
end
