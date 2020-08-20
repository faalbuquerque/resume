require 'rails_helper'
feature 'view dashboard page' do
  context 'dashboard' do
    it 'successfully' do
			test = FactoryBot.create(:admin)
			
      visit root_path
      click_link I18n.t(:login).capitalize
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
			click_button I18n.t(:login).capitalize

      expect(page).to have_content(I18n.t(:dashboard).capitalize)

      expect(page).to have_link(I18n.t(:personal_infos))
      expect(page).to have_link(I18n.t(:academic_infos))
      expect(page).to have_link(I18n.t(:courses))
      expect(page).to have_link(I18n.t(:experiences))
      expect(page).to have_link(I18n.t(:skills))
      expect(page).to have_link(I18n.t(:projects))
		end
		
		it 'failure - data wrong' do

      visit root_path
      click_link I18n.t(:login).capitalize
      
      fill_in 'admin_email', with: 'test@example.com'
      fill_in 'admin_password', with: ''
			click_button I18n.t(:login).capitalize

      expect(page).to_not have_content(I18n.t(:dashboard).capitalize)
      expect(page).to_not have_link(I18n.t(:personal_infos))
      expect(page).to_not have_link(I18n.t(:academic_infos))
      expect(page).to_not have_link(I18n.t(:courses))
      expect(page).to_not have_link(I18n.t(:experiences))
      expect(page).to_not have_link(I18n.t(:skills))
      expect(page).to_not have_link(I18n.t(:projects))
      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_button(I18n.t(:login).capitalize)
    end
  end
end
