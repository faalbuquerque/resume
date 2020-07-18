require 'rails_helper'

feature 'view homepage' do
  context 'admin' do
    it 'successfully' do
      visit root_path

      expect(page).to have_content(I18n.t(:login).capitalize)
      expect(page).to have_content(I18n.t(:resume).capitalize)
    end
  end
end