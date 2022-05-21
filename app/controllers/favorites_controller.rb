class FavoritesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find_by_slug(params[:movie_id])
    @movie.favorites.create(user: current_user)

    redirect_to @movie
  end

  def destroy
    @movie = Movie.find_by_slug(params[:movie_id])
    @movie.favorites.where(user_id: current_user).destroy_all

    redirect_to @movie
  end
end
