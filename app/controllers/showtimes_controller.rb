class ShowtimesController < ApplicationController
  def index
    @date = find_date(params[:date])
    @movies = Movie.showings_on_date(@date)
  end
end
