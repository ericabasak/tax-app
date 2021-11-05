class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.boolean :imported
      t.boolean :exempt

      t.timestamps
    end
  end
end
