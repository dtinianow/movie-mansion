require 'rails_helper'

RSpec.feature 'Admin can view all orders' do
  scenario 'they visit the admin orders path and see all orders' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    order = create(:order, showtime: showtime)
    formatted_date = showtime.start_time.strftime('%-m/%-d/%Y')
    formatted_showtime = showtime.start_time.strftime('%-I:%M %p')

    visit admin_orders_path

    within('#admin-orders-header') do
      expect(page).to have_content 'All Orders'
    end

    within('#admin-orders-table tbody tr:nth-child(1)') do
      expect(page).to have_content(order.id)
      expect(page).to have_content(order.first_name)
      expect(page).to have_content(order.last_name)
      expect(page).to have_content(movie.title)
      expect(page).to have_content(formatted_date)
      expect(page).to have_content(formatted_showtime)
      expect(page).to have_content(showtime.price)
      expect(page).to have_content(showtime.auditorium.title)
    end
  end
end
