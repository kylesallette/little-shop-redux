class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many              :items
#   before_validation     :default_image

  # SOME IDEAS ON HOW TO FIND Category with most expensive item && Category with least expensive item.
  #
  def self.most_expensive_item_category
    highest_price = Item.maximum(:unit_price)
    Item.find_by(unit_price: highest_price).category
  end

  def self.least_expensive_item_category
    lowest_price = Item.minimum(:unit_price)
    Item.find_by(unit_price: lowest_price).category
  end

#   def default_image
#     if self.id == 1
#       self.image = "http://www.ptahai.com/wp-content/uploads/2016/06/Best-Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg"
#     end
#   end
end


# change csv
