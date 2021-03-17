class CreateMyObjectifs < ActiveRecord::Migration[6.0]
  def change
    create_table :my_objectifs do |t|
      t.integer :calorie,          null: false, default: ""
      t.integer :age,              null: false, default: ""
      t.integer :height,           null: false, default: ""
      t.integer :weight,           null: false, default: ""
      t.string :sexe,              null: false, default: ""
      t.string :objectif,          null: false, default: ""
      t.string :activity,          null: false, default: ""
      t.timestamps
    end
  end
end
