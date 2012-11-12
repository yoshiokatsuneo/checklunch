class Restaurant < ActiveRecord::Base
  attr_accessible :logo_url, :name, :url, :menu_url, :address
  has_many :menus
end
