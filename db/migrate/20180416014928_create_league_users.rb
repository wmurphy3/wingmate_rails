class CreateLeagueUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :league_users do |t|
      t.integer :league_id
      t.integer :user_id
      t.integer :points
      t.boolean :active

      t.timestamps
    end

    add_index :league_users, :league_id
    add_index :league_users, :user_id
  end
end
