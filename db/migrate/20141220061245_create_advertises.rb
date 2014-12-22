class CreateAdvertises < ActiveRecord::Migration
  def change
    create_table :advertises do |t|
      t.string :name
      t.string :text

      t.timestamps
    end
  end
end
