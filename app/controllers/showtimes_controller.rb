class ShowtimesController < ApplicationController
  def index
    @date = DateTime.now.to_date
    @movies = Movie.showings_on_date(@date)
  end
end
