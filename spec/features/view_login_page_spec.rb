require 'rails_helper'

feature 'view login page' do
  context 'user' do
    it 'successfully' do
      # Arrange
    
      # Act
      visit root_path
      click_link I18n.t(:login).capitalize

      # Assert
      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_content(I18n.t(:login).capitalize)
    end

    #it 'already logged in' do
    #  # Arrange
    #  user = FactoryBot.create(:admin)
    #  visit new_admin_session_path
    #  fill_in I18n.t(:email).capitalize, :with => user.email
    #  fill_in I18n.t(:password).capitalize, :with => user.password
    #  click_button I18n.t(:login).capitalize
    #  # Act
    #
    #  # Assert
    #  expect(page).not_to have_content(I18n.t(:email).capitalize)
    #  expect(page).not_to have_content(I18n.t(:password).capitalize)
    #  expect(page).not_to have_content(I18n.t(:login).capitalize)
    #end
  end
end
