class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :calorie
      t.string :name
      t.string :title, default: "breakfast"

      t.timestamps
    end
  end
end
