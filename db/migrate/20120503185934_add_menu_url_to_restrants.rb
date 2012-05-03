class AddMenuUrlToRestrants < ActiveRecord::Migration
  def change
    add_column :restrants, :menu_url, :string
  end
end
