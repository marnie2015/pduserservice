class CreateAgentUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :agent_users do |t|
      t.string :branch_name
      t.string :address
      t.string :region
      t.string :city
      t.references :agent, foreign_key: true
      t.references :user, foreign_key: true
      t.time :office_hours_start
      t.time :office_hours_end

      t.timestamps
    end
  end
end
