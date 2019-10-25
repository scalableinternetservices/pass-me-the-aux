class SessionsController < ApplicationController
  def create
   user_info = request.env["omniauth.auth"]
    @user           = User.new
    @user.id        = user_info["uid"]
    @user.name      = user_info["info"]["name"]
    @user.image_url = user_info["info"]["image"]
    session[:user] = @user
    session[:user_id] = user_info["uid"]
    if User.find_by(id: session[:user_id])
      redirect_to home_path
    else
      @user.save
      redirect_to home_path
    end
  end

  def destroy
    session.delete :user
    redirect_to root_path
  end

end
