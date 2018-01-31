require "./spec/spec_helper"

describe Merchant do
  describe "validations" do
    it "it is invalid without a name" do
      merchant = Merchant.create()

      expect(merchant).to_not be_valid
    end
  end
  describe "class methods" do
    describe ".most_items" do
      it "returns merchant with most items" do
        merchant1 = Merchant.create!(name: "merch1")
        merchant2 = Merchant.create!(name: "merch2")
        Item.create!(name: "item1", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item2", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item3", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item4", description: "desc", unit_price: 100, merchant_id: merchant2.id)
        Item.create!(name: "item5", description: "desc", unit_price: 1000, merchant_id: merchant2.id)

        expect(Merchant.most_items).to eq(merchant1)
      end
    end
    describe ".highest_priced_item" do
      it "returns merchant with highest priced item" do
        merchant1 = Merchant.create!(name: "merch1")
        merchant2 = Merchant.create!(name: "merch2")
        Item.create!(name: "item1", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item2", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item3", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item4", description: "desc", unit_price: 100, merchant_id: merchant2.id)
        Item.create!(name: "item5", description: "desc", unit_price: 1000, merchant_id: merchant2.id)

        expect(Merchant.highest_priced_item).to eq(merchant2)
      end
    end
  end
  describe "instance methods" do
    describe "#item_count" do
      it "returns item count of given merchant" do
        merchant1 = Merchant.create!(name: "merch1")
        merchant2 = Merchant.create!(name: "merch2")
        Item.create!(name: "item1", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item2", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item3", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item4", description: "desc", unit_price: 100, merchant_id: merchant2.id)
        Item.create!(name: "item5", description: "desc", unit_price: 1000, merchant_id: merchant2.id)

        expect(merchant1.item_count).to eq(3)
        expect(merchant2.item_count).to eq(2)
      end
    end
    describe "#total_item_price" do
      it "returns total item price of a given merchant" do
        merchant1 = Merchant.create!(name: "merch1")
        merchant2 = Merchant.create!(name: "merch2")
        Item.create!(name: "item1", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item2", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item3", description: "desc", unit_price: 100, merchant_id: merchant1.id)
        Item.create!(name: "item4", description: "desc", unit_price: 100, merchant_id: merchant2.id)
        Item.create!(name: "item5", description: "desc", unit_price: 1000, merchant_id: merchant2.id)

        expect(merchant1.total_item_price).to eq(300)
        expect(merchant2.total_item_price).to eq(1100)
      end
    end
  end
end
