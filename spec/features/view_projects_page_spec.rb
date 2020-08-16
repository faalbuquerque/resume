require 'rails_helper'
feature 'view projects' do
  context 'projects' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit root_path
      click_link I18n.t(:login).capitalize

      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize
      click_link I18n.t(:projects)

      expect(page).to have_content(I18n.t(:projects))
    end

    it 'failure' do
      visit projects_path
      expect(page).to_not have_content(I18n.t(:projects))
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
