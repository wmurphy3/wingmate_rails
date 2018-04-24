class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.integer :points
      t.integer :category_id
      t.string :name
      
      t.timestamps
    end
  end
end
