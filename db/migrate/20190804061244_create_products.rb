class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :description
      t.text :image
      t.string :name
      t.decimal :price
      t.integer :category_id

      t.timestamps
    end
  end
end
