class CreateSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
