require 'rails_helper'

RSpec.feature 'User can view movie showtimes by date' do
  scenario 'they see all movie showtimes on the current date by default' do
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime, movie: movie, auditorium: auditorium)
    current_date = DateTime.now.strftime('%-m/%-d/%Y')
    formatted_showtime = showtime.start_time.strftime("%-I:%M %p")

    visit showtimes_path

    within('.showtimes-header') do
      expect(page).to have_content "Movies Playing On #{current_date}"
    end

    within('.showtimes-table tbody tr:nth-child(1)') do
      expect(page).to have_xpath("//img[@src='#{movie.image_url}']")
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.minutes)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(formatted_showtime)
    end
  end

  scenario 'they see all movie showtimes on a specific date' do
    current_date = '3/1/2017'
    movie = create(:movie)
    auditorium = create(:auditorium)
    showtime = create(:showtime,
      movie: movie,
      auditorium: auditorium,
      start_time: DateTime.strptime(current_date, '%m/%d/%Y')
    )
    formatted_showtime = showtime.start_time.strftime("%-I:%M %p")

    visit showtimes_path(date: current_date)

    within('.showtimes-header') do
      expect(page).to have_content "Movies Playing On #{current_date}"
    end

    within('.showtimes-table tbody tr:nth-child(1)') do
      expect(page).to have_xpath("//img[@src='#{movie.image_url}']")
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.minutes)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(formatted_showtime)
    end
  end
end
