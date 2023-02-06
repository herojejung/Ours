class CreateTagPostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_post_images do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
