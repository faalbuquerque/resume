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
      expect(page).to have_button(I18n.t(:login).capitalize)
    end
  end
end
