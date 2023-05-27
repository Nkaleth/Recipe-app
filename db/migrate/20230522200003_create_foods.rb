class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.float :price
      t.float :quantity, default: 0
      t.references :user, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end