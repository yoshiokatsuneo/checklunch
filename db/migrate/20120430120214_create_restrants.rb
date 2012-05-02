class CreateRestrants < ActiveRecord::Migration
  def change
    create_table :restrants do |t|
      t.string :name
      t.string :url
      t.string :logo_url

      t.timestamps
    end
  end
end
