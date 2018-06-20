class CreatePromos < ActiveRecord::Migration[5.2]
  def change
    create_table :promos do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :meal, foreign_key: true
      t.integer :discount_cents

      t.timestamps
    end
  end
end
