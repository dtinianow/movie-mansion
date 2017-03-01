require 'rails_helper'

RSpec.feature 'User can book a showtime' do
  scenario 'they fill out the order form and successfully book the showtime' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    formatted_date = showtime.start_time.strftime('%-m/%-d/%Y')
    formatted_showtime = showtime.start_time.strftime('%-I:%M %p')

    visit new_order_path(showtime: showtime)

    within('#new-showtime-order-form') do
      fill_in 'First Name', with: 'David'
      fill_in 'Last Name', with: 'T'
      fill_in 'Email Address', with: 'david@example.com'
      fill_in 'Credit Card Number', with: '555555555555'
      fill_in 'Credit Card Expiration Date', with: '03/19'
      click_button 'Book Showtime'
    end

    order = Order.last

    expect(current_path).to eq showtimes_path

    within('.alert') do
      expect(page).to have_content "Thanks for your order #{order.first_name}!
        A confirmation email has been sent to #{order.email}."
    end

    # within('.showtime-order-table') do
    #   expect(page).to have_content(order.id)
    #   expect(page).to have_content(order.first_name)
    #   expect(page).to have_content(order.last_name)
    #   expect(page).to have_content(order.email)
    #   expect(page).to have_content(movie.title)
    #   expect(page).to have_content(movie.minutes)
    #   expect(page).to have_content(movie.rating)
    #   expect(page).to have_content(movie.genre)
    #   expect(page).to have_content(formatted_date)
    #   expect(page).to have_content(formatted_showtime)
    #   expect(page).to have_content(showtime.auditorium.title)
    #   expect(page).to have_content(showtime.price)
    # end
  end
end
