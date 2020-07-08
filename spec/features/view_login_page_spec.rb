require 'rails_helper'

feature 'view login page' do
  context 'user' do
    it 'successfully' do

      visit root_path
      click_on I18n.t(:login).capitalize

      expect(page).to have_content(I18n.t(:email).capitalize)
      expect(page).to have_content(I18n.t(:password).capitalize)
      expect(page).to have_content(I18n.t(:go).capitalize)
    end
  end
end
