class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find(params[:showtime])
    @order = Order.new
  end

  def create
    order = Order.create(order_params)
    UserNotifier.order_confirmation(order).deliver_now
    flash[:success] = "Thanks for your order #{order_params[:first_name]}!
      A confirmation email has been sent to #{order_params[:email]}."
    redirect_to showtimes_path
  end

  private

  def order_params
    params.require(:order).permit(
      :first_name,
      :last_name,
      :email,
      :card_number,
      :card_exp_date,
      :showtime_id
    )
  end
end
