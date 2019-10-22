class HomeController < ApplicationController
  def new
    if logged_in?
      render 'chooserole'
    else
      redirect_to login_path
    end 
  end
  def recommend
    User.where(id: session[:user_id]).update_all(role: 0)
    render 'recommend'
  end
  def recommendee
    User.where(id: session[:user_id]).update_all(role: 1)
    render 'recommendee'
  end

end
