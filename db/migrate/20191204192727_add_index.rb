class AddIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :scores, [:score, :user_id, :user_name]
    add_index :users, [:name, :email, :role, :id]
    add_index :recommendations, [:requestor_id, :url_to_song, :recommender_id, :verdict], :name => 'index_recommendations'
  end
end
