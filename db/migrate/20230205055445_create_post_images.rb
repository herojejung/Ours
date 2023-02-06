class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.references :post, null: false, foreign_key: true
      t.string :text, null: false, default: ""
      t.string :title, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
