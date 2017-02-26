class ShowtimesController < ApplicationController
  def index
    @date = DateTime.now.to_date
    @movies = Movie.joins(:showtimes).where(showtimes: {
      start_time: @date.midnight..@date.end_of_day
    })
  end
end
