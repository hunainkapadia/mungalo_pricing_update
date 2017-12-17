class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :current_price
      t.integer :new_price

      t.timestamps
    end
  end
end
