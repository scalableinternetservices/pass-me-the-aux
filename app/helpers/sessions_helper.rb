module SessionsHelper
    def logged_in?
        session.has_key? :user
    end

    def current_user
        Marshal.load session[:user] if logged_in?
    end
end
