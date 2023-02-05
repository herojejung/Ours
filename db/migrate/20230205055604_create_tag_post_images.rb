class CreateTagPostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_post_images do |t|

      t.timestamps
    end
  end
end
