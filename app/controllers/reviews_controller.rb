class ReviewsController < ApplicationController
  before_action :set_event

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_path(@movie), notice: 'Thanks for your review!'
    else
      render :new
    end
  end

  private

  def set_event
    @movie = Movie.find_by_id(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end
end
