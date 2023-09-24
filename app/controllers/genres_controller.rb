# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :require_admin, except: %i[index show]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @movies = genre.movies
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genres_path, notice: 'Genre successfully created!'
    else
      @genres = Genre.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    genre
  end

  def update
    if genre.update(genre_params)
      redirect_to genres_path, notice: 'Genre successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    genre.destroy
    redirect_to genres_path, status: :see_other, alert: 'Genre successfully deleted!'
  end

  private

  def genre
    @genre ||= Genre.find_by!(slug: params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
