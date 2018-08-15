class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :category
      t.string :sub_category
      t.string :url

      t.timestamps
    end
  end
end
