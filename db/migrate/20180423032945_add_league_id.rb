class AddLeagueId < ActiveRecord::Migration[5.1]
  def change
    add_column :user_achievements, :league_id, :integer
    add_index :user_achievements, :league_id
  end
end
