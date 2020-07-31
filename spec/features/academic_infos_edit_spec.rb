require 'rails_helper'
feature 'academic infos' do
  context 'edit data' do
    it 'successfully' do
      clean_admin
      admin = FactoryBot.create(:admin)

      academic_info = FactoryBot.create(:academic_info, name_academic: 'Designer')
      academic_info_1 = FactoryBot.create(:academic_info, name_academic: 'Cientista', institution_academic: 'Fiap')
      academic_info_2 = FactoryBot.create(:academic_info, name_academic: 'Contador', start_date: '2020-05-06')

      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#academic_n_#{academic_info_1.id}").click

      fill_in I18n.t(:name_academic).capitalize, with: 'Analista'
      fill_in I18n.t(:institution_academic).capitalize, with: 'UNIP'

      click_button I18n.t(:save).capitalize

      visit academic_infos_path

      expect(page).to_not have_content 'Cientista'
      expect(page).to have_content 'Analista'
      expect(page).to_not have_content 'Fiap'
      expect(page).to have_content 'UNIP'

      expect(page).to have_content 'Designer'
      expect(page).to have_content 'Contador'
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
      academic_info_1 = FactoryBot.create(:academic_info, institution_academic: 'Unicamp')
      academic_info_2 = FactoryBot.create(:academic_info, institution_academic: 'FAAP')
      
      visit academic_infos_path
      
      fill_in 'admin_email', with: admin.email
      fill_in 'admin_password', with: admin.password
      click_button I18n.t(:login).capitalize

      find("a#academic_d_#{academic_info_1.id}").click

      expect(page).to have_content 'Fatec'
      expect(page).to_not have_content 'Unicamp'
      expect(page).to have_content 'FAAP'
    end
  end
end

def clean_admin
  if Admin.any?
    Admin.destroy(Admin.first.id)
  end
end
