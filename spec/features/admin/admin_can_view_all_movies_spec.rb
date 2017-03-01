require 'rails_helper'

RSpec.feature 'Admin can view all movies' do
  scenario 'they visit the admin movies path and see all movies' do
    movie = create(:movie)
    # auditorium = create(:auditorium)
    # showtime = create(:showtime, movie: movie, auditorium: auditorium)
    # order = create(:order, showtime: showtime)
    # formatted_date = showtime.start_time.strftime('%-m/%-d/%Y')
    # formatted_showtime = showtime.start_time.strftime('%-I:%M %p')

    visit admin_movies_path

    within('#admin-movies-header') do
      expect(page).to have_content 'Order History By Movie'
    end

    within('#admin-movies-list li') do
      expect(page).to have_content movie.title
    end
  end
end
