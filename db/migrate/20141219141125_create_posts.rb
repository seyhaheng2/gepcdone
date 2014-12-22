class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :viewer, default: 0

      t.timestamps
    end
  end
end
