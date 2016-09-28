require 'rails_helper'
feature 'User signs up' do

  before :each do
    logout(:user)
    @user  = FactoryGirl.create(:user)
    @stylesheet = FactoryGirl.create(:stylesheet)
    sign_up_with @user.email, @user.password
  end

  scenario 'with blank custom style' do   
    click_link("Customize Page")
    expect(page).to have_content('Editing Stylesheet')
  end

  scenario 'with invalid password' do
    
    sign_up_with @user.email, 'invalid password'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'with blank password' do
    logout(:user)
    sign_up_with @user.email, ''

    expect(page).to have_content('Invalid Email or password.')
  end
end