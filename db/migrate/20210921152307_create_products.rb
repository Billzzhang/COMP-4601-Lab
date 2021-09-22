class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.json :dimensions
      t.integer :stock

      t.timestamps
    end
  end
end
