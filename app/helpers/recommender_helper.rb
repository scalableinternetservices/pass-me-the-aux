module RecommenderHelper
    def update_recommendation(song_url)
        @currentrecommendation.update_attributes(:url_to_song => song_url)
    end

    def find_current_recommendee
        #find a recommendation which was claimed but doesn't have a song
        unfinished_recommendation = Recommendation.find_by(recommender_id: session[:user_id], url_to_song: nil)
        # assign self to new unclaimed recommendation request
        if unfinished_recommendation == nil
            openrecommendation = Recommendation.where(recommender_name: nil).
            where.not(requestor_id: session[:user_id]).
            first
            # if no one eligible found, return nil
            if openrecommendation == nil
                return nil
            end
            # update recommendation to assign it to self
            openrecommendation.update_attributes(:recommender_id => session[:user_id], 
                :recommender_name => current_user.name)
            return openrecommendation
        end
        return unfinished_recommendation
    end

    def cache_key_for_recommendation(recommendation)
        "recommendation-#{recommendation.requestor_id}-#{recommendation.recommender_id}"
    end
end
