module HomeHelper
    def update_role(role)
        User.where(id: session[:user_id]).update_all(role: role)
    end

    def enter_recommendee
        rec = Recommendation.find_by(requestor_id: session[:user_id], verdict: nil)
        if rec != nil && rec.url_to_song != nil
            return 1
        elsif rec != nil && rec.url_to_song == nil
            return 0
        else
            @rec           = Recommendation.new
            @rec.requestor_id        = session[:user_id]
            @rec.requestor_name      = current_user.name
            @rec.save
            return 0
        end
    end
end