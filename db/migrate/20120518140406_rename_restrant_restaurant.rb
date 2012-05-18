class RenameRestrantRestaurant < ActiveRecord::Migration
  def up
    rename_column :menus, :restrant_id, :restaurant_id
    rename_table :restrants, :restaurants
  end

  def down
    rename_column :menus, :restaurant_id, :restrant_id
    rename_table :restaurant, :restrant
  end
end
