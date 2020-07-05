require 'rails_helper'

feature 'view homepage' do
  context 'user' do
    it 'successfully' do

      visit root_path

      expect(page).to have_content("Login")
      expect(page).to have_content("Meu Curriculo")

    end
  end
end