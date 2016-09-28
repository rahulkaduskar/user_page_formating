require 'rails_helper'
feature 'User signs up' do

  before :each do
    @user = create(:user)
    sign_up_with @user.email, @user.password
  end

  scenario 'with valid email and password' do   
    expect(page).to have_content('Customize Page')
  end

  scenario 'with invalid password' do
    if page.has_link?('Log out')
      page.click_link('Log out')
    end
    sign_up_with @user.email, 'invalid password'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'with blank password' do
    logout(:user)
    sign_up_with @user.email, ''

    expect(page).to have_content('Invalid Email or password.')
  end

end