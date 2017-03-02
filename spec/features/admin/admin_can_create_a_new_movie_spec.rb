require 'rails_helper'

RSpec.feature 'Admin can create a new movie' do
  scenario 'they create a movie and it appears in the movie list' do
    expect(Movie.count).to eq 0

    visit new_admin_movie_path

    within('#new-movie-header') do
      expect(page).to have_content 'Add New Movie'
    end

    within('#new-movie-form') do
      fill_in 'Title', with: 'Ex Machina'
      fill_in 'Minutes', with: 108
      fill_in 'Rating', with: 'R'
      fill_in 'Genre', with: 'Sci-Fi'
      fill_in 'Image URL', with: 'https://c1.staticflickr.com/8/7649/17097191625_77c28cf79b_b.jpg'
      click_button 'Create Movie'
    end

    expect(Movie.count).to eq 1

    movie = Movie.last

    expect(movie.title).to eq 'Ex Machina'
    expect(movie.minutes).to eq 108
    expect(movie.rating).to eq 'R'
    expect(movie.genre).to eq 'Sci-Fi'
    expect(movie.image_url).to eq 'https://c1.staticflickr.com/8/7649/17097191625_77c28cf79b_b.jpg'
    expect(current_path).to eq admin_movies_path
    expect(page).to have_content 'Movie successfully created!'
  end
end
