require 'rails_helper'

RSpec.feature 'Admin can edit an auditorium' do
  scenario 'they edit an auditoriums attributes and see them update' do
    auditorium = create(:auditorium)

    visit admin_auditoriums_path

    click_on 'Manage'

    within('.admin-edit-auditorium-header') do
      expect(page).to have_content "Edit Auditorium #{auditorium.title}"
    end

    within('.admin-edit-auditorium-form') do
      fill_in 'Title', with: 'B'
      fill_in 'Capacity', with: 200
      click_button 'Update Auditorium'
    end

    auditorium.reload

    expect(auditorium.title).to eq 'B'
    expect(auditorium.capacity).to eq 200
    expect(current_path).to eq admin_auditoriums_path
    expect(page).to have_content 'Auditorium successfully updated!'
  end
end
