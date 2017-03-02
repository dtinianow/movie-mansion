require 'rails_helper'

RSpec.feature 'User must have valid credit card to book showtime' do
  scenario 'they enter an invalid number and cannot book the showtime' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    card_number = '5555555555555555'

    expect(Order.count).to eq 0
    expect(showtime.tickets_available).to eq 160

    visit new_order_path(showtime: showtime)

    within('#new-showtime-order-form') do
      fill_in 'First Name', with: 'David'
      fill_in 'Last Name', with: 'T'
      fill_in 'Email Address', with: 'david@example.com'
      fill_in 'Credit Card Number', with: card_number
      fill_in 'Credit Card Expiration Date', with: '03/19'
      click_button 'Book Showtime'
    end

    expect(current_path).to eq new_order_path
    expect(Order.count).to eq 0
    showtime.reload
    expect(showtime.tickets_available).to eq 160

    within('.alert') do
      expect(page).to have_content 'Oops! Something went wrong.'
    end
  end
end
