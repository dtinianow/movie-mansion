require 'rails_helper'

RSpec.feature 'Admin can view orders of a specific movie' do
  scenario 'they visit the admin path for the movie order and see all orders' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    order = create(:order, showtime: showtime)
    # formatted_date = showtime.start_time.strftime('%-m/%-d/%Y')
    # formatted_showtime = showtime.start_time.strftime('%-I:%M %p')

    visit admin_movie_orders_path(movie)

    within('.admin-movie-order-header') do
      expect(page).to have_content "All Orders for #{movie.title}"
    end

    within('.admin-movie-orders-table tbody tr:nth-child(1)') do
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
