class HomeController < ApplicationController
  include RecommenderHelper
  def new
    if logged_in?
      @rec = Recommendation.where(requestor_id: session[:user_id]).where(verdict: nil).where.not(url_to_song: nil).first
      render 'chooserole'
    else
      redirect_to login_path
    end 
  end

  def recommend
    update_role(0)
    @currentrecommendation = find_current_recommendee
    puts @currentrecommendation
    if @currentrecommendation && !@currentrecommendation.nil?
    @recommendee_history = Recommendation.where(requestor_id: @currentrecommendation.requestor_id).where.not(url_to_song: nil).all
    end
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
    @rec = Recommendation.where(requestor_id: session[:user_id]).where(verdict: nil).where.not(url_to_song: nil).first
    if status == 0
      render 'recommendee-waiting'
    else
      render 'recommendee-recommended'
    end
  end

  def feedback
    Recommendation.where(requestor_id: session[:user_id]).where(verdict: nil).where.not(url_to_song: nil).update_all(verdict: params[:verdict])
    redirect_to home_path
  end

  def dum_create
    @user           = User.new
    @user.id        = rand(1000000)
    @user.name      = "Jungkook"
    @user.image_url = "https://www.askideas.com/media/12/Cute-Baby-Funny-Pig-Picture.jpg"
    session[:user] = @user
    session[:user_id] = @user.id
    if User.find_by(id: session[:user_id])
      redirect_to home_path
    else
      @user.save
      redirect_to home_path
    end
  end

  def leaderboard
    @recs = Recommendation.where.not(verdict: nil).all
    if stale?(@recs)
      get_scores
      render 'leaderboard'
    end
  end




end
