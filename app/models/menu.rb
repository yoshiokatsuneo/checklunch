class Menu < ActiveRecord::Base
  belongs_to :restrant
  attr_accessible :date, :price, :title
end
