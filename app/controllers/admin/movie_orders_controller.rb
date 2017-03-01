class Admin::MovieOrdersController < Admin::BaseController
  def index
    @orders = Order.joins(:showtime).where(showtimes: { movie_id: params[:id] })
  end
end
