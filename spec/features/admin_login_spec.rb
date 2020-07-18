feature 'log in' do
    context 'admin new login' do
      it 'successfully' do
        test = FactoryBot.create(:admin)

        visit new_admin_session_path

        fill_in I18n.t(:email).capitalize, :with => test.email
        fill_in I18n.t(:password).capitalize, :with => test.password
        click_button I18n.t(:login).capitalize

        expect(page).to have_content "Dashboard"
      end
    end
  end
