class AddDetailsToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :context, :string
  end
end
