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

    def recommendations
        @recommendations = Recommendation.where(requestor_id: session[:user_id]).where.not(url_to_song: nil).all
    end

    def recommendations_count
        @recommendations = Recommendation.where(requestor_id: session[:user_id]).where.not(url_to_song: nil).all.count
    end

    def get_scores
        @scores = Hash.new(0)
        recs = Recommendation.where.not(verdict: nil).all

        for rec in recs do 
        @scores[rec.recommender_name] += rec.verdict
        end

        @scores.sort_by {|k,v| -v}
    end

    def recommended?
        @rec = Recommendation.where(requestor_id: session[:user_id]).where(verdict: nil).where.not(url_to_song: nil).all
    end
end