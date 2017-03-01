class AddShowtimeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :showtime, foreign_key: true
  end
end
