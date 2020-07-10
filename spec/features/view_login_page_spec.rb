require 'rails_helper'

feature 'view login page' do
  context 'user' do
    it 'successfully' do

      #visit root_path
      #click_link "Entrar"
      visit new_admin_session_path

      expect(page).to have_content "Login"
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
    end
  end
end


