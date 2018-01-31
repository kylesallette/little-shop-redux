class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many              :items

  def self.most_items
    select("merchants.*, count(items) AS items_count_by_merchant_id")
    .joins(:items)
    .group(:merchant_id, :id)
    .order("items_count_by_merchant_id DESC")
    .first
  end

  def self.highest_priced_item
    highest_price = Item.maximum(:unit_price)
    Item.find_by(unit_price: highest_price).merchant
  end

  def item_count
    self.items.count
  end

  def total_item_price
    self.items.map do |item|
      item.unit_price
    end.sum
  end
end
