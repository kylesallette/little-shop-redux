class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many              :items

  # SOME IDEAS ON HOW TO FIND Category with most expensive item && Category with least expensive item.
  #
  # def self.most_expensive_item_category
  #   highest_price = items.maximum(:unit_price)
  #   items.find_by(:unit_price highest_price).category
  # end
  #
  # def self.least_expensive_item_category
  #   lowest_price = items.minimum(:unit_price)
  #   items.find_by(:unit_price lowest_price).category
  # end
end
