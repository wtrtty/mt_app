class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, :email, :string
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :birthday, :date
    add_column :users, :profile, :text, limit: 800
    add_column :users, :prefecture, :integer, null: false, default: 1

    add_column :users, timestamps
    end
  end
end
