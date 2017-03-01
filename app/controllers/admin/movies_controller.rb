class Admin::MoviesController < Admin::BaseController
  def index
    @movies = Movie.all
  end
end
