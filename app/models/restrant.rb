class Restrant < ActiveRecord::Base
  attr_accessible :logo_url, :name, :url, :menu_url
  has_many :menus
end
