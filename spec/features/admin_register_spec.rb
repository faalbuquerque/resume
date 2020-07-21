require 'rails_helper'

feature 'register' do
  context 'new register' do
    it 'successfully' do
      clean_admin

			visit root_path
			click_link I18n.t(:login).capitalize
			click_link I18n.t(:sign_up).capitalize

			fill_in 'admin_email', with: 'test@example.com'
			fill_in 'admin_password', with: '123456'
			fill_in 'admin_password_confirmation', with: '123456'
			click_button(I18n.t(:sign_up).capitalize)

			expect(page).to have_content 'Dashboard'
		end
		
		it 'register failure - in blank' do
      clean_admin

			visit root_path
			click_link I18n.t(:login).capitalize
			click_link I18n.t(:sign_up).capitalize

			fill_in 'admin_email', with: ''
			fill_in 'admin_password', with: ''
			fill_in 'admin_password_confirmation', with: ''
			click_button(I18n.t(:sign_up).capitalize)

			expect(page).to have_content 'está com campo vazio, favor corrigir'
      expect(page).to have_content(I18n.t(:email).capitalize)
			expect(page).to have_content(I18n.t(:password).capitalize)
			expect(page).to have_content(I18n.t(:password_confirmation).capitalize)
      expect(page).to have_button(I18n.t(:sign_up).capitalize)
		end
		
		it 'register failure - data wrong' do
      clean_admin

			visit root_path
			click_link I18n.t(:login).capitalize
			click_link I18n.t(:sign_up).capitalize

			fill_in 'admin_email', with: 'test@example.com'
			fill_in 'admin_password', with: '123'
			fill_in 'admin_password_confirmation', with: '123'
			click_button(I18n.t(:sign_up).capitalize)

			expect(page).to have_content 'Password é muito curto (mínimo: 6 caracteres)'
      expect(page).to have_content(I18n.t(:email).capitalize)
			expect(page).to have_content(I18n.t(:password).capitalize)
			expect(page).to have_content(I18n.t(:password_confirmation).capitalize)
      expect(page).to have_button(I18n.t(:sign_up).capitalize)
    end
  end
end
  
def clean_admin
	if Admin.any?
		Admin.destroy(Admin.first.id)
	end
end
