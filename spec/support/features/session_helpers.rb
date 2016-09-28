module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit root_path
      if page.has_link?('Log out')
        page.click_link('Log out')
      end
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end
  end
end