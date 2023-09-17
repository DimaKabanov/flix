# frozen_string_literal: true

module MoviesHelper
  def total_gross(movie)
    if movie.flop?
      'Flop!'
    else
      number_to_currency movie.total_gross, precision: 0
    end
  end

  def year_of(movie)
    movie.released_on.year
  end

  def nav_link_to(name, path)
    link_to name, path, class: current_page?(path) ? 'active' : nil
  end
end
