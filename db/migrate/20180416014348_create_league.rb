class CreateLeague < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :type
      t.integer :points
      t.datetime :time
      t.integer :winner_id
      t.integer :admin_id
      t.timestamps
    end

    add_index :leagues, :admin_id
    add_index :leagues, :winner_id
  end
end
