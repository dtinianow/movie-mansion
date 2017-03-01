class UserNotifier < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail(to: order.email, subject: "Your ticket to #{order.showtime.movie.title}.")
  end
end
