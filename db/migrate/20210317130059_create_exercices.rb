class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.string :name
      t.string :categorie
      t.integer :cal
      t.text :description
      t.belongs_to :equipement, index: true


      t.timestamps
    end
  end
end
