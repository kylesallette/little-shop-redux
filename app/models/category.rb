class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many              :items

  def average_price
    (items.average(:unit_price).to_f).round(2)
  end

  def self.most_expensive_item_category
    highest_price = Item.maximum(:unit_price)
    Item.find_by(unit_price: highest_price).category
  end

  def self.least_expensive_item_category
    lowest_price = Item.minimum(:unit_price)
    Item.find_by(unit_price: lowest_price).category
  end
end
