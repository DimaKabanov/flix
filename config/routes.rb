# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  resources :users
  get 'signup', to: 'users#new'

  resources :movies do
    resources :reviews
  end
end
