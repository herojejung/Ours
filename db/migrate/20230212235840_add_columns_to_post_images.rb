class AddColumnsToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :title, :string, null: false,default: ""
    add_column :post_images, :text, :string, null: false,default: ""
    add_column :post_images, :latitude, :float
    add_column :post_images, :longitude, :float
  end
end
