class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find(params[:showtime])
    @order = Order.new
  end

  def create
  end
end
