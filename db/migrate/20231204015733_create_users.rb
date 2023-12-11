class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender, null: false, default: 0
      t.date :birthday
      t.text :profile, limit: 800
      t.string :avatar
      t.integer :prefecture, null: false, default: 1

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
  end
end
