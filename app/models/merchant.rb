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
end
