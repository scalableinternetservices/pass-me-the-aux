module SessionsHelper
    def logged_in?
        session.has_key? :user
    end

    def current_user
        @current_user = @current_user || User.find_by(id: session[:user_id])
    end
end
