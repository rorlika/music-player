class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.integer :user_id
    	t.integer :favorite_id
    	t.string  :favorite_type

    	t.timestamps
    end
    add_index :favorites, [:user_id,:favorite_id,:favorite_type],unique: true
  end
end
