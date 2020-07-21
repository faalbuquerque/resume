require 'rails_helper'

feature 'log in' do
  context 'new login' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit root_path
      click_link I18n.t(:login).capitalize

      fill_in 'admin_email', :with => test.email
      fill_in 'admin_password', :with => test.password
      click_button I18n.t(:login).capitalize

      expect(page).to have_content "Dashboard"
    end

    it 'login failure or invalid' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit root_path
      click_link I18n.t(:login).capitalize

      fill_in 'admin_email', :with => test.email
      fill_in 'admin_password', :with => test.password
      test.delete
      click_button I18n.t(:login).capitalize

      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_button(I18n.t(:login).capitalize)
    end

    it 'blank login' do
      clean_admin
      test = FactoryBot.create(:admin)

      visit root_path
      click_link I18n.t(:login).capitalize

      fill_in 'admin_email', :with => ''
      fill_in 'admin_password', :with => ''
      click_button I18n.t(:login).capitalize

      expect(page).to have_content 'Email e/ou senha inválidos.'
      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_button(I18n.t(:login).capitalize)
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
