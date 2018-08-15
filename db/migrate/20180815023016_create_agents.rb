class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :cde
      t.string :fullname

      t.timestamps
    end
  end
end
