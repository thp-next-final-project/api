class Mods < ActiveRecord::Migration[6.0]
  def change
    create_table :mods do |t|
      t.integer :calorie
      t.timestamps
    end
  end
end
