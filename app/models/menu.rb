class Menu < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :date, :price, :title, :restaurant_id
end
