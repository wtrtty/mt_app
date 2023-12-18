class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender, null: false, default: '未設定'
      t.date :birthday
      t.text :profile, limit: 800
      t.string :avatar
      t.string :live, null: false, default: '未設定'

      t.timestamps
    end
  end
end
