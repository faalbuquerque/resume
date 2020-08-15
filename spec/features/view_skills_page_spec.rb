require 'rails_helper'
feature 'view skills page' do
  context 'skills' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit root_path
      click_link I18n.t(:login).capitalize

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize
      click_link "Skills"

      expect(page).to have_content "Skills"
    end

    it 'failure' do
      visit skills_path
      expect(page).to_not have_content "Skills"
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end