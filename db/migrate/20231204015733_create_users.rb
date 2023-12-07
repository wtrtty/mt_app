class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :nickname, :string, :email, :string
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :birthday, :date
    add_column :users, :profile, :string, limit: 800
    add_column :users, :prefecture, :integer, null: false, default: 1

    remove_column :users, :nickname, :string # 特に使う予定の無いカラムなので削除

    add_column :users, timestamps
    end
  end
end
