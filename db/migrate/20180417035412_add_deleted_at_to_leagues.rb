class AddDeletedAtToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :deleted_at, :datetime
    add_index :leagues, :deleted_at
  end
end
