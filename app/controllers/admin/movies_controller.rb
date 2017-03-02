class Admin::MoviesController < Admin::BaseController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(movie_params)
    if auditorium.save
      flash[:success] = 'Movie successfully created!'
      redirect_to admin_movies_path
    else
      flash.now[:danger] = 'Oops! Something went wrong.'
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :minutes, :rating, :genre, :image_url)
  end
end
