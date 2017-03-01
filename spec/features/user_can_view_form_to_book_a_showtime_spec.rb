require 'rails_helper'

RSpec.feature 'User can view form to a book a showtime' do
  scenario 'they click on a showtime and see a new order form' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    formatted_date = showtime.start_time.strftime('%-m/%-d/%Y')
    formatted_showtime = showtime.start_time.strftime('%-I:%M %p')

    visit showtimes_path

    click_on formatted_showtime

    expect(current_path).to eq new_order_path

    within('#new-showtime-order-header') do
      expect(page).to have_content "Purchase Ticket for #{movie.title} on
        #{formatted_date} at #{formatted_showtime}"
    end

    within('#new-showtime-order-form') do
      expect(page).to have_content 'First Name'
      expect(page).to have_content 'Last Name'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Credit Card Number'
      expect(page).to have_content 'Credit Card Expiration Date'
      expect(page).to have_button 'Book Showtime'
    end
  end
end
