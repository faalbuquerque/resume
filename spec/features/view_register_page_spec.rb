require 'rails_helper'

feature 'view register page' do
  context 'register' do
    it 'successfully' do
      visit root_path
      click_link I18n.t(:login).capitalize
      click_link I18n.t(:sign_up).capitalize

      expect(page).to have_content(I18n.t(:register_screen))
      expect(page).to have_content(I18n.t(:login).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_button(I18n.t(:sign_up).capitalize)
    end
  end
end
