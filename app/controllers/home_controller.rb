class HomeController < ApplicationController
include SessionsHelper
  def new
    if logged_in?
      render 'chooserole'
    else
      redirect_to login_path
    end 
  end
  def recommend
    render 'recommend'
  end
  def recommendee
    render 'recommendee'
  end
end
