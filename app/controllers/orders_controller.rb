class OrdersController < ApplicationController
  def show
  end

  def new
    @showtime = Showtime.find(params[:showtime])
    @order = Order.new
  end

  def create
    order = order.create(

    )
    flash[:success] = 'Thanks for your order! A confirmation email has been sent.'
  end
end
