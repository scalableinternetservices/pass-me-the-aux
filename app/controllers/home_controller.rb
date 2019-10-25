class HomeController < ApplicationController
  def new
    if logged_in?
      render 'chooserole'
    else
      redirect_to login_path
    end 
  end
  def recommend
    update_role(0)
    render 'recommend'
  end
  def recommendee
    update_role(1)
    status = enter_recommendee
    if status == 0
      render 'recommendee-waiting'
    else 
      render 'recommendee-recommended'
    end
  end

end
