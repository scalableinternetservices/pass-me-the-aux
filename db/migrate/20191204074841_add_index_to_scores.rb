class AddIndexToScores < ActiveRecord::Migration[6.0]
  def change
    add_index :scores, :user_id
  end
end
