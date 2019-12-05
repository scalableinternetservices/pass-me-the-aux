class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :user_id
      t.integer :score
    end
  end
end
