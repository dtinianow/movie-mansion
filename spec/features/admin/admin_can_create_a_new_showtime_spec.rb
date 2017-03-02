# require 'rails_helper'
#
# RSpec.feature 'Admin can create a new showtime' do
#   scenario 'they see the new the showtime appear' do
#     movie = create(:movie)
#     auditorium = create(:auditorium)
#     showtime = create(:showtime, movie: movie, auditorium: auditorium)
#     current_date = DateTime.now.strftime('%-m/%-d/%Y')
#     formatted_showtime = showtime.start_time.strftime("%-I:%M %p")
#
#     visit admin_showtimes_path
#
#     within('#admin-showtimes-header') do
#       expect(page).to have_content "Movies Playing On #{current_date}"
#     end
#
#     within('#add-new-movie-showing') do
#       expect(page).to have_link('Create New Showtime')
#     end
#
#     within('#admin-showtimes-table tbody tr:nth-child(1)') do
#       expect(page).to have_xpath("//img[@src='#{movie.image_url}']")
#       expect(page).to have_content(movie.title)
#       expect(page).to have_content(movie.minutes)
#       expect(page).to have_content(movie.rating)
#       expect(page).to have_content(movie.genre)
#       expect(page).to have_content(formatted_showtime)
#     end
#
#     expect(Showtime.count).to eq 0
#
#     visit new_admin_showtime_path
#
#
#
#
#   end
# end
