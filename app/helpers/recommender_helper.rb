module RecommenderHelper
    def find_current_recommendee
        #find a recommendation which was claimed but doesn't have a song
        unfinished_recommendation = Recommendation.find_by(recommender_id: session[:user_id], url_to_song: nil)
        # assign self to new unclaimed recommendation request
        if unfinished_recommendation == nil
            openrecommendation = Recommendation.where(recommender_name: nil).
            where.not(requestor_id: session[:user_id]).
            first
            # update recommendation to assign it to self
            openrecommendation.update_attributes(:recommender_id => session[:user_id], 
                :recommender_name => current_user.name)
            return openrecommendation
        end
        return unfinished_recommendation
    end
end
