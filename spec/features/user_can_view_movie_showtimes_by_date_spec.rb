require 'rails_helper'

RSpec.feature 'User can view movie showtimes by date' do
  scenario 'they see all movie showtimes on the current date by default' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime)
    current_date = DateTime.now.strftime('%m/%d/%Y')

    visit showtimes_path

    within('#showtimes-header') do
      expect(page).to have_content "Movies Playing On #{current_date}"
    end

    within('#showtimes-table tbody tr:nth-child(1)') do
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.minutes)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(movie.image_url)
      expect(page).to have_content(auditorium.title)
      expect(page).to have_content(showtime.start_time)
      expect(page).to have_content(showtime.price)
    end
  end
end
