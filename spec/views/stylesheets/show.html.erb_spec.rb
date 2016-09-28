require 'rails_helper'

RSpec.describe "stylesheets/show", type: :view do
  before(:each) do
    @user  = FactoryGirl.create(:user)
    @stylesheet = FactoryGirl.create(:stylesheet)
  end

  it "renders css " do
    render
    expect(rendered).to match(/font-family/)
    expect(rendered).to match(/font-size/)
    expect(rendered).to match(/color/)
  end
end
