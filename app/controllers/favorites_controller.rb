# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :require_signin

  def create
    movie.favorites.create!(user: current_user)
    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    redirect_to movie
  end

  private

  def movie
    @movie ||= Movie.find_by!(slug: params[:movie_id])
  end
end
