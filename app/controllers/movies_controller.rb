# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :require_signin, except: %i[index show]
  before_action :require_admin, except: %i[index show]

  def index
    @movies = Movie.send(movies_filter)
  end

  def show
    @fans = movie.fans
    @genres = movie.genres.order(:name)

    if current_user
      @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
  end

  def edit
    movie
  end

  def update
    if movie.update(movie_params)
      redirect_to movie, notice: 'Movie successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    movie.destroy
    redirect_to movies_path, status: :see_other, alert: 'Movie successfully deleted!'
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title,
      :description,
      :rating,
      :released_on,
      :total_gross,
      :director,
      :duration,
      :main_image,
      genre_ids: []
    )
  end

  def movie
    @movie ||= Movie.find_by!(slug: params[:id])
  end

  def movies_filter
    if params[:filter].in? %w[upcoming recent]
      params[:filter]
    else
      :released
    end
  end
end
