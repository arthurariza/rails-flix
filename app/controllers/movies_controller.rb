class MoviesController < ApplicationController
  before_action :set_movie, only: %w[show edit update]

  def index
    @movies = Movie.all
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
  end
end
