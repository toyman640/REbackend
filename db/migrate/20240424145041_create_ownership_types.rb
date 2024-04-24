class CreateOwnershipTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :ownership_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
