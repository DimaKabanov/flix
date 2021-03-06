# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = movie.reviews
  end

  def new
    @review = movie.reviews.new
  end

  def create
    @review = movie.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_url(movie), notice: t('.success')
    else
      render :new
    end
  end

  def edit
    @review = movie.reviews.find(params[:id])
  end

  def update
    @review = movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_url(movie), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @review = movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_reviews_url(movie), alert: t('.success')
  end

  private

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(
      :name,
      :stars,
      :comment
    )
  end
end
