class MoviesController < ApplicationController
  before_action :set_movie, only: %w[show edit update]

  def index
    @movies = Movie.released
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    @movie.save
    redirect_to @movie
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

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_url
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration,
                                  :image_file_name)
  end
end
