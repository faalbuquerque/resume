require 'rails_helper'
feature 'academic infos' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)
      academic_info = FactoryBot.create(:academic_info)

      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:edit).capitalize

      fill_in I18n.t(:name_academic).capitalize, with: 'Analista de Sistemas'
      fill_in I18n.t(:description_academic).capitalize, with: 'Analise de Sistemas'
      fill_in I18n.t(:institution_academic).capitalize, with: 'UNIP'
      fill_in I18n.t(:conclusion_academic).capitalize, with: '2010'

      click_button I18n.t(:save).capitalize

      expect(page).to have_content 'Analista de Sistemas'
      expect(page).to have_content 'Analise de Sistemas'
      expect(page).to have_content 'UNIP'
      expect(page).to have_content '2010'
    end

    it 'failure - in blank' do
      clean_admin
      admin = FactoryBot.create(:admin)
      academic_info = FactoryBot.create(:academic_info)

      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:edit).capitalize

      fill_in I18n.t(:name_academic).capitalize, with: ''
      fill_in I18n.t(:description_academic).capitalize, with: ''
      fill_in I18n.t(:institution_academic).capitalize, with: ''
      fill_in I18n.t(:conclusion_academic).capitalize, with: ''
      click_button I18n.t(:save).capitalize

      expect(page).to have_content("#{I18n.t(:name_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:description_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:institution_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
      expect(page).to have_content("#{I18n.t(:conclusion_academic).capitalize} #{I18n.t('activerecord.errors.messages.blank')}")
    end

    it 'delete' do
      clean_admin
      admin = FactoryBot.create(:admin)
      academic_info = FactoryBot.create(:academic_info)

      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      click_link I18n.t(:delete).capitalize

      expect(page).to_not have_content 'Desenvolvedor de Softwares'
      expect(page).to_not have_content 'Desenvolver softwares'
      expect(page).to_not have_content 'Fatec'
      expect(page).to_not have_content '2012'
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
