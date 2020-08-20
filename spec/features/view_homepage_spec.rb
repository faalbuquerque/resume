require 'rails_helper'
feature 'view homepage' do
  context 'homepage' do
    it 'successfully' do
      visit root_path

      expect(page).to have_content(I18n.t(:login).capitalize)
      expect(page).to have_content(I18n.t(:resume).capitalize)
      expect(page).to have_content(I18n.t(:personal_infos))
      expect(page).to have_content(I18n.t(:academic_infos))
      expect(page).to have_content(I18n.t(:courses))
      expect(page).to have_content(I18n.t(:skills))
      expect(page).to have_content(I18n.t(:experiences))
      expect(page).to have_content(I18n.t(:projects))
    end
  end
end
