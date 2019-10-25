class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, :id => false do |t|
      t.string :name
      t.string :email
      t.integer :role
      t.string :id
      t.string :image_url

      t.timestamps
    end
  end
end
