class UpdateActive < ActiveRecord::Migration[5.1]
  def change
    change_column :league_users, :active, :integer, default: 0
  end
end
