class HomeController < ApplicationController
  include RecommenderHelper
  def new
    if logged_in?
      render 'chooserole'
    else
      redirect_to login_path
    end 
  end
  def recommend
    update_role(0)
    @currentrecommendation = find_current_recommendee
    render 'recommender-recommending'
  end
  def recommendee
    update_role(1)
    status = enter_recommendee
    if status == 0
      render 'recommendee-waiting'
    else
      @rec = Recommendation.find_by(requestor_id: session[:user_id])
      render 'recommendee-recommended'
    end
  end

end
