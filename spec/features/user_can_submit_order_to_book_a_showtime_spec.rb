require 'rails_helper'

RSpec.feature 'User can submit order to book a showtime' do
  scenario 'they click on a showtime and see a new order form' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime,
      movie: movie,
      auditorium: auditorium
    )
    current_date = DateTime.now.strftime('%-m/%-d/%Y')
    formatted_showtime = showtime.start_time.strftime("%-I:%M %p")

    visit showtimes_path

    click_on formatted_showtime

    expect(current_path).to eq new_order_path

    within('#showtime-order-confirmation') do
      expect(page).to have_content "#{movie.name} on \
        #{date.strftime('%-m/%-d/%Y')} at \
        #{showtime.start_time.strftime('%-m/%-d/%Y')}"
    end

    within('#showtime-order-form') do
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Credit Card Number'
      expect(page).to have_content 'Expiration Date'
    end
  end
end
