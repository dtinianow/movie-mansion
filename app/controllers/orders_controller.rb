class OrdersController < ApplicationController
  def new
    @showtime = Showtime.find(params[:showtime])
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    if order.showtime.tickets_available.zero?
      flash[:danger] = 'Sorry, there are no more tickets available.'
      redirect_to showtimes_path
    elsif CreditCardValidations::Luhn.valid?(order_params[:card_number]) && order.save
      order.showtime.update(tickets_available: order.showtime.tickets_available - 1)
      UserNotifier.order_confirmation(order).deliver_now
      flash[:success] = "Thanks for your order #{order_params[:first_name]}!
      A confirmation email has been sent to #{order_params[:email]}."
      redirect_to showtimes_path
    else
      flash[:error] = 'Oops! Something went wrong.'
      redirect_to new_order_path(showtime: order_params[:showtime_id])
    end
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
