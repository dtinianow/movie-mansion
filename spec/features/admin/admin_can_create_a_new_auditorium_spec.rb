require 'rails_helper'

RSpec.feature 'Admin can create an auditorium' do
  scenario 'they create an auditorium and it appears in the auditorium list' do
    expect(Auditorium.count).to eq 0

    visit new_admin_auditorium_path

    within('.admin-new-auditorium-header') do
      expect(page).to have_content 'Add New Auditorium'
    end

    within('.admin-new-auditorium-form') do
      fill_in 'Title', with: 'A'
      fill_in 'Capacity', with: 150
      click_button 'Create Auditorium'
    end

    expect(Auditorium.count).to eq 1

    auditorium = Auditorium.last

    expect(auditorium.title).to eq 'A'
    expect(auditorium.capacity).to eq 150
    expect(current_path).to eq admin_auditoriums_path
    expect(page).to have_content 'Auditorium successfully created!'
  end
end
