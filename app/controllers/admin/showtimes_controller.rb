class Admin::ShowtimesController < Admin::BaseController
  def new
    @showtime = Showtime.new
    @movies = Movie.all_titles
    @auditoriums = Auditorium.all_titles
  end

  def create
    showtime_params[:start_time] = convert_to_date(showtime_params[:start_time])
    showtime = Showtime.new(showtime_params)
    if showtime.save
      flash[:success] = 'Showtime successfully created!'
      redirect_to new_admin_showtimes_path
    else
      flash.now[:danger] = 'Oops! Something went wrong.'
      render :new
    end
  end

  private

  def showtime_params
    params.require(:showtime).permit(:start_time, :price, :movies, :auditoriums)
  end
end
