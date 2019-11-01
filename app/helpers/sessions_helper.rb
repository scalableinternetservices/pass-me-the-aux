module SessionsHelper
    def logged_in?
        (session.has_key? :user) && !(User.find_by(id: session[:user_id]).nil?)
    end

    def current_user
        @current_user = @current_user || User.find_by(id: session[:user_id])
    end

    def recommendations
        @recommendations = @recommendations || Recommendation.where("requestor_id = %{uid} AND url_to_song IS NOT NULL AND url_to_song <> ''" % { :uid => @current_user.id})
    end
end
