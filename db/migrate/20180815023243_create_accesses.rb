class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.string :access_type

      t.timestamps
    end
  end
end
