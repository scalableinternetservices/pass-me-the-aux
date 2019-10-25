class HomeController < ApplicationController
include SessionsHelper
  def new
    if logged_in?
      render 'new'
    else
      redirect_to login_path
    end 
  end
end
