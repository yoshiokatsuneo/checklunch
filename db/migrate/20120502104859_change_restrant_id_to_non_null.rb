class ChangeRestrantIdToNonNull < ActiveRecord::Migration
  def up
    Menu.all.each do |menu|
      if menu.restrant_id == nil then
        menu.destroy
      end
    end
    change_column :menus, :restrant_id, :integer, :null => false
  end

  def down
  end
end
