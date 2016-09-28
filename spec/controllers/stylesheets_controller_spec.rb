require 'rails_helper'
RSpec.describe StylesheetsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Stylesheet. As you add validations to Stylesheet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{
      family: "Sans-Serif",
      size: 20,
      color: "#DFDFDF",
      custom: "a{ color: #00FF00;}"
    }
  }

  let(:invalid_attributes) { {
      family: "Sans-Serif",
      size: 20,
      color: "#DFDFDF",
      custom: "sdfsd: dsfdsf"
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StylesheetsController. Be sure to keep this updated too.
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @current_user = FactoryGirl.create(:user)
    sign_in  @current_user, scope: :user
  end 

  describe "GET #show" do
    render_views
    it "assigns the requested stylesheet as @stylesheet" do
      get :show, format: 'css'
      expect(response.body).to have_content("font-family: #{@current_user.stylesheet.family}")
    end
  end

  describe "GET #edit" do
    it "assigns the requested stylesheet as @stylesheet" do
      get :edit
      expect(assigns(:stylesheet)).to eq(@current_user.stylesheet)
    end
  end

  describe "PUT #create_update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          family: "Sans-Serif",
          size: 12,
          color: "#00FF00",
          custom: "a{ color: #00FF00;}"
        }
      }
      it "updates the requested stylesheet" do
        put :create_update, stylesheet: new_attributes
        expect(response.response_code).to eq(200)
      end

      it "redirects to the stylesheet" do
        put :create_update, stylesheet: invalid_attributes
        expect(response.response_code).to eq(422)
      end
    end
  end

end
