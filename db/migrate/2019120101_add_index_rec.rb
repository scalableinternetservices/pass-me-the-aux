class AddIndexRec < ActiveRecord::Migration[6.0]
    def change
        add_index :recommendations, :name
    end
end