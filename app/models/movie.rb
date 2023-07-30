# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  RATINGS = %w[G PG PG-13 R NC-17].freeze

  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :rating, inclusion: { in: RATINGS }

  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: 'must be a JPG or PNG image'
  }

  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end

  def self.released
    where('released_on < ?', Time.zone.now).order(released_on: :desc)
  end
end
