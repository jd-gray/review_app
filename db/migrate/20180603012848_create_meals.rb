class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :description
      t.integer :total_rating, default: 0

      t.timestamps
    end
  end
end
