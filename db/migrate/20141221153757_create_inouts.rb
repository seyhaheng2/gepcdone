class CreateInouts < ActiveRecord::Migration
  def change
    create_table :inouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
