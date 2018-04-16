class UpdateLeague < ActiveRecord::Migration[5.1]
  def change
    rename_column :leagues, :type, :league_type
  end
end
