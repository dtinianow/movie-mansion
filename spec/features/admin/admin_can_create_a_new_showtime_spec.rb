require 'rails_helper'

RSpec.feature 'Admin can create a new showtime' do
  scenario 'they see the new the showtime appear' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    # showtime = create(:showtime, movie: movie, auditorium: auditorium)
    # current_date = DateTime.now.strftime('%-m/%-d/%Y')
    # formatted_showtime = showtime.start_time.strftime("%-I:%M %p")

    visit new_admin_showtime_path

    within('#new-showtime-header') do
      expect(page).to have_content 'Create New Showtime'
    end

    within('#new-showtime-form') do
      fill_in 'Price', with: '10.00'
      fill_in 'Date and Time', with: '3/1/2017 2:30 PM'
      select movie.title
      select auditorium.title
      click_button 'Create Showtime'
    end

    expect(Showtime.count).to eq 1

    showtime = Showtime.last

    expect(showtime.movie_id).to eq movie.id
    expect(showtime.auditorium_id).to eq auditorium.id
    expect(tickets_available.price).to eq auditorium.capacity
    expect(showtime.start_time.showtime.strftime('%-I:%M %p')).to eq '2:30 PM'
    expect(showtime.start_time.showtime.strftime('%-m/%-d/%Y')).to eq '3/1/2017'
    expect(showtime.price).to eq 10.00
    expect(page).to have_content 'Showtime successfully created!'
    expect(current_path).to eq new_admin_showtimes_path
  end
end
