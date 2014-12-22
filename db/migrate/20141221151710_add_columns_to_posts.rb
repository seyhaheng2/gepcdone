class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
    add_reference :posts, :user, index: true
    add_column :posts, :logo, :string
    add_column :posts, :video, :string
    add_reference :posts, :inout, index: true
  end
end
