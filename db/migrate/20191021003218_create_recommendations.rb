class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :requestor_name
      t.string :requestor_id
      t.string :url_to_song
      t.string :recommender_name
      t.string :recommender_id
      t.integer :verdict

      t.timestamps
    end
  end
end
