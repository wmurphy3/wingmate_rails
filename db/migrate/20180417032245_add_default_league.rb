class AddDefaultLeague < ActiveRecord::Migration[5.1]
  def change
    change_column :league_users, :points, :integer, default: 0
  end
end
