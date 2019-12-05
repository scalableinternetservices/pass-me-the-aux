class AddNameToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :user_name, :string
  end
end
