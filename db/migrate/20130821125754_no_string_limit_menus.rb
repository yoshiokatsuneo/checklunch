class NoStringLimitMenus < ActiveRecord::Migration
  def up
  	change_column :menus, :title, :text, :limit => nil
  end

  def down
	change_column :menus, :title, :string
  end
end

