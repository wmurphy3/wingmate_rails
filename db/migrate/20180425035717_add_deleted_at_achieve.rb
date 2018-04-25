class AddDeletedAtAchieve < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :deleted_at, :datetime
    add_index :achievements, :deleted_at
  end
end
