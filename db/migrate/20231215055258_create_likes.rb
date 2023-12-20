class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :from_user_id, null: false # 誰が
      t.integer :to_user_id, null: false   # 誰に対して

      t.timestamps
    end

    add_index :likes, :from_user_id
    add_index :likes, :to_user_id
    add_index :likes, [:from_user_id, :to_user_id], unique: true
    #add_index :relationships, :follower_id
    #add_index :relationships, :followed_id
    #add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
