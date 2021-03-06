require 'rails_helper'
feature 'academic infos form' do
  context 'add data' do
    it 'successfully' do
      clean_admin
      test = FactoryBot.create(:admin)
      FactoryBot.create(:academic_info)

      visit academic_infos_path
      
      fill_in 'admin_email', with: test.email
      fill_in 'admin_password', with: test.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_academic).capitalize, with: 'Programação'
      fill_in I18n.t(:institution_academic).capitalize, with: 'Fatec'
      fill_in I18n.t(:start_date).capitalize, with: '2000-11-12'
      page.select 'Cursando', from: I18n.t(:conclusion_academic).capitalize
      fill_in I18n.t(:description_academic).capitalize, with: 'Desenvolvimento de Software'
      click_button I18n.t(:save).capitalize
      
      expect(page).to have_content(I18n.t(:details).capitalize)
      expect(page).to have_content 'Programação'
      expect(page).to have_content 'Fatec'
      expect(page).to have_content '2000-11-12'
      expect(page).to have_content 'Cursando'
      expect(page).to have_content 'Desenvolvimento de Software'
    end

    it 'in blank' do
      clean_admin
      admin = FactoryBot.create(:admin)
      academic_info = FactoryBot.create(:academic_info)

      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:add_new_date).capitalize

      fill_in I18n.t(:name_academic).capitalize, with: ''
      fill_in I18n.t(:description_academic).capitalize, with: ''
      fill_in I18n.t(:institution_academic).capitalize, with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:name_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:institution_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
