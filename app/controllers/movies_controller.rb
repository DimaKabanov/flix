# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = movie
  end

  def edit
    @movie = movie
  end

  def update
    movie.update(movie_params)
    redirect_to movie
  end

  private

  def movie
    @movie ||= Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title,
      :rating,
      :total_gross,
      :description,
      :released_on
    )
  end
end
