class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :reset_password_token
      t.string :designation
      t.string :mobile_number
      t.string :role

      t.timestamps
    end
  end
end
