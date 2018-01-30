class Item < ActiveRecord::Base
  validates_presence_of :name,
                        :description,
                        :unit_price
                        # :image
  # before_validation     :default_image A THOUGHT
  belongs_to            :merchant
  belongs_to            :category

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

  # THESE ARE THOUGHTS ON A WAY TO SET A DEFAULT ITEM IMAGE
  #
  # def default_image
  #   if self.image == ""
  #     self.image = "enter a image url here"
  #   end
  # end
  #
  # OR (NOT SURE WHICH)
  #
  # def self.default_image
  #   if self.image == ""
  #     self.image = "enter a image url here"
  #   end
  # end
end
