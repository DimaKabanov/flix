# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.released
  end

  def show
    @movie = movie
  end

  def edit
    @movie = movie
  end

  def update
    if movie.update(movie_params)
      redirect_to movie, notice: t('.success')
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    movie.destroy
    redirect_to movies_url, alert: t('.success')
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
      :released_on,
      :director,
      :duration,
      :image_file_name
    )
  end
end
