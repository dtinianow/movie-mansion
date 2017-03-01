require 'rails_helper'

RSpec.feature 'Admin can view all auditoriums' do
  scenario 'they visit the admin auditoriums path and see all auditoriums' do
    auditorium = create(:auditorium)

    visit admin_auditoriums_path

    within('#admin-auditoriums-header') do
      expect(page).to have_content 'Auditoriums'
    end

    within('#admin-auditoriums-table tbody tr:nth-child(1)') do
      expect(page).to have_content(auditorium.id)
      expect(page).to have_content(auditorium.title)
      expect(page).to have_content(auditorium.capacity)
      expect(page).to have_link('Manage Showtimes')
      expect(page).to have_link('Manage Auditorium')
    end
  end
end
