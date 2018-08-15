class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :reset_password_token
      t.string :designation
      t.string :mobile_number

      t.timestamps
    end
  end
end
