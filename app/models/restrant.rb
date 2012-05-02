class Restrant < ActiveRecord::Base
  attr_accessible :logo_url, :name, :url
  has_many :menus
end
