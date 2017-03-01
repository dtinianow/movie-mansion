class Admin::Movies::OrdersController < Admin::BaseController
  def index
    @movie = Movie.find(params[:id])
    @orders = Order.select_by_movie(@movie)
  end
end
