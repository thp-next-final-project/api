class CreateMyPerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :my_performances do |t|
      t.integer :repetitions
      t.integer :weight
      t.belongs_to :user, index: true
      t.belongs_to :exercice, index: true

      t.timestamps
    end
  end
end
