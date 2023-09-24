# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :require_signin

  def index
    @reviews = movie.reviews
  end

  def new
    @review = movie.reviews.new
  end

  def create
    @review = movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movie_reviews_path(movie), notice: 'Thanks for your review!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movie
    @movie ||= Movie.find_by!(slug: params[:movie_id])
  end

  def review_params
    params.require(:review).permit(
      :stars,
      :comment
    )
  end
end
