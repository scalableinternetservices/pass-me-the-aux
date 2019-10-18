class SessionsController < ApplicationController
  def create
    user_info = request.env["omniauth.auth"]
    user           = User.new
    user.id        = user_info["uid"]
    user.name      = user_info["info"]["name"]
    user.image_url = user_info["info"]["image"]
    session[:user] = Marshal.dump user

    redirect_to home_path
  end
end
