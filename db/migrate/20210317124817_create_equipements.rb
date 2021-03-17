class CreateEquipements < ActiveRecord::Migration[6.0]
  def change
    create_table :equipements do |t|
      t.string :name
      t.integer :weight
      t.timestamps
    end
  end
end
