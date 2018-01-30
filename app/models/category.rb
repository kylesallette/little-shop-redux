class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many              :items

  def average_price
    items.average(:unit_price)
  end
end
