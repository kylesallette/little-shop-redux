class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id
  belongs_to            :merchants
  belongs_to            :categories

  def self.total
    Item.all.count
  end

  def self.average_price
    (average(:unit_price).to_f / 100).round(2)
  end

  def self.newest_item
    Item.last
  end

  def self.oldest_item
    Item.first
  end
end
