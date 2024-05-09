class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.decimal :price
      t.integer :no_of_rooms
      t.references :property_type, null: false, foreign_key: true
      t.references :ownership_type, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.text :description
      t.string :address
      t.integer :no_of_bathrooms

      t.timestamps
    end
  end
end
