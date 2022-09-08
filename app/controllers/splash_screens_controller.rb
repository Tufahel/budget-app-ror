class SplashScreensController < ApplicationController
  before_action :authenticate!

  def index; end

  private

  def authenticate!
    if user_signed_in?
      redirect_to categories_path
    else
      redirect_to root_path
    end
  end
end
