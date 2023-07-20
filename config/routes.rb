# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'
  get 'movies', to: 'movies#index'
  get 'movies/:id', to: 'movies#show', as: 'movie'
  get 'movies/:id/edit', to: 'movies#edit', as: 'edit_movie'
end
