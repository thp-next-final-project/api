class CreateJointureMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :jointure_meals do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :mod, index: true
      t.timestamps
    end
  end
end
