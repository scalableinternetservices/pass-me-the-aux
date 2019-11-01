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
    if @currentrecommendation == nil
      render 'recommender-noneavailable'
      return
    end
    song_url = params[:song_url]
    if song_url != nil
        update_recommendation(song_url)
        render 'recommender-success'
        return
    else
      render 'recommender-recommending'
      return
    end
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

  def feedback
    Recommendation.where(requestor_id: session[:user_id]).update_all(verdict: params[:param_1])
    render 'chooserole'
  end
end
