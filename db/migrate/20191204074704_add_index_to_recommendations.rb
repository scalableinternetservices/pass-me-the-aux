class AddIndexToRecommendations < ActiveRecord::Migration[6.0]
  def change
    add_index :recommendations, :requestor_id
  end
end