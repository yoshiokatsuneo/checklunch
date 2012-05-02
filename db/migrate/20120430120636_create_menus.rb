class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.date :date
      t.float :price
      t.references :restrant

      t.timestamps
    end
    add_index :menus, :restrant_id
  end
end
