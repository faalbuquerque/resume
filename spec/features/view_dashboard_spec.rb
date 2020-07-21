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

      expect(page).to have_content 'Dashboard'
		end
		
		it 'failure - data wrong' do

      visit root_path
      click_link I18n.t(:login).capitalize
      
      fill_in 'admin_email', with: 'test@example.com'
      fill_in 'admin_password', with: ''
			click_button I18n.t(:login).capitalize

			expect(page).to_not have_content 'Dashboard'
      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_button(I18n.t(:login).capitalize)
    end
  end
end