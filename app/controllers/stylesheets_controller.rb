class StylesheetsController < ApplicationController
  before_action :set_stylesheet, only: [:show, :edit, :create_update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  # GET /stylesheets/1
  # GET /stylesheets/1.json
  def show
    respond_to do |format|
      format.css
    end
  end

  # GET /stylesheets/1/edit
  def edit
  end

  def create_update
    if @stylesheet.update(stylesheet_params)
      render text: "", status: :ok
    else
      render json: @stylesheet.errors, status: :unprocessable_entity 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylesheet
      @stylesheet = current_user.present? ? Stylesheet.find_or_create_by({user_id: current_user.id}) : Stylesheet.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stylesheet_params
      params.require(:stylesheet).permit(:family, :size, :color, :t, :custom)
    end
end
