class CreateMyEquipements < ActiveRecord::Migration[6.0]
  def change
    create_table :my_equipements do |t|
      t.belongs_to :user, index: true
      t.belongs_to :equipement, index: true

      t.timestamps
    end
  end
end
