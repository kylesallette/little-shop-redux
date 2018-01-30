require "./spec/spec_helper"

describe Category do
  describe "validations" do
    it "it is invalid without a name" do
      category = Category.create()

      expect(category).to_not be_valid
      end
  end

  describe "#average_price" do
    it "it returns average price of items for one category" do
      red_category = Category.create!(name: "red")
      purple_category = Category.create!(name: "purple")
      Item.create!(name: "apple", description: "yum", unit_price: 20, merchant_id: 123, category_id: red_category.id)
      Item.create!(name: "pear", description: "delish", unit_price: 40, merchant_id: 222, category_id: red_category.id)
      Item.create!(name: "dragonfruit", description: "yum", unit_price: 20, merchant_id: 333, category_id: purple_category.id)


      expect(red_category.average_price).to eq 30
      expect(purple_category.average_price).to eq 20
    end
  end

end
