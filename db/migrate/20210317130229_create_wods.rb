class CreateWods < ActiveRecord::Migration[6.0]
  def change
    create_table :wods do |t|
      t.integer :cal

      t.timestamps
    end
  end
end
