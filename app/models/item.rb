class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price
  before_validation     :default_category
  belongs_to            :merchant
  belongs_to            :category

  def self.total
    Item.all.count
  end

  def self.average_price
    (average(:unit_price).to_f / 100).round(2)
  end

  def self.newest_item
    Item.order(created_at: :desc).first
  end

  def self.oldest_item
    Item.order(created_at: :asc).first
  end

  def default_category
    if self.category_id == nil
      self.category_id = [1,2,3].sample
    end
  end
end
