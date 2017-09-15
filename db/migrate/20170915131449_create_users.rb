class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,                null: false
      t.string :username,             null: false
      t.string :password_digest,      null: false
      t.string :password_reset_token, null: false, limit: 60
      t.string :confirm_token
      t.boolean :confirmed_email

      t.timestamps
    end
  end
end
