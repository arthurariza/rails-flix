class ReviewsController < ApplicationController
  def index
    @movie = Movie.find_by_id(params[:movie_id])
    @reviews = @movie.reviews
  end
end
