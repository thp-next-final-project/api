class CreateJointureWodExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :jointure_wod_exercices do |t|
      t.belongs_to :wod, index: true
      t.belongs_to :exercice, index: true
      t.timestamps
    end
  end
end
