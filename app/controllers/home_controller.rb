class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, only:[:index]

  # This is the root home page action for all user.
  def index
  end
end