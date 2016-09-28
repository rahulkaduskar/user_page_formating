require 'rails_helper'

RSpec.describe "stylesheets/edit", type: :view do
  before(:each) do
    @user  = FactoryGirl.create(:user)
    @stylesheet = FactoryGirl.create(:stylesheet)
  end

  it "renders the edit stylesheet form" do
    render

    rendered.should have_selector('select#stylesheet_family')
    rendered.should have_selector('select#stylesheet_size')
    rendered.should have_selector('input#stylesheet_color')

    rendered.should have_selector('textarea#stylesheet_custom')
  end
end
