class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :cal_per_something
      t.integer :quantity
      t.integer :weight
      t.integer :liter

      t.timestamps
    end
  end
end
