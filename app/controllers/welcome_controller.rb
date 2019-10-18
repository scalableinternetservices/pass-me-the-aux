class WelcomeController < ApplicationController
  include SessionsHelper
  def index
    if logged_in?
      redirect_to home_path
    else
      render 'index'
    end
  end
end
