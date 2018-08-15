class CreateRoleAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :role_accesses do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.references :access, foreign_key: true

      t.timestamps
    end
  end
end
