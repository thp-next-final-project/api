class CreateJointureIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :jointure_ingredients do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :meal, index: true
      t.timestamps
    end
  end
end
