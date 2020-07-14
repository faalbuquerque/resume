require 'rails_helper'

feature 'view homepage' do
  context 'user' do
    it 'successfully' do

      visit root_path

      expect(page).to have_content "Logar"
      expect(page).to have_content(I18n.t(:resume).capitalize)

    end
  end
end