require "./spec/spec_helper"

describe Item do
  describe "Class methods" do
    describe ".newest_item" do
      it "returns most recent item based on created_at" do
      oldest_item = Item.create!(name: "apple", description: "yum", unit_price: 20, merchant_id: 123, created_at: "2016-01-11 11:51:37 UTC")
      newest_item = Item.create!(name: "pear", description: "delish", unit_price: 40, merchant_id: 222, created_at: "2017-01-11 11:51:37 UTC")

      expect(Item.newest_item).to eq(newest_item)
    end
  end
    describe ".oldest_item" do
      it "returns least recent item based on created_at" do
        oldest_item = Item.create!(name: "apple", description: "yum", unit_price: 20, merchant_id: 123)
        newest_item = Item.create!(name: "pear", description: "delish", unit_price: 40, merchant_id: 222)

        expect(Item.oldest_item).to eq(oldest_item)
      end
    end
    describe ".total" do
      it "returns total number of items" do
        Item.create!(name: "apple", description: "yum", unit_price: 20, merchant_id: 123, created_at: "2016-01-11 11:51:37 UTC")
        Item.create!(name: "pear", description: "delish", unit_price: 40, merchant_id: 222, created_at: "2017-01-11 11:51:37 UTC")

        expect(Item.total).to eq(2)
      end
    end
    describe ".average_price" do
      it "returns average price of all items" do
        Item.create!(name: "apple", description: "yum", unit_price: 2000, merchant_id: 123, created_at: "2016-01-11 11:51:37 UTC")
        Item.create!(name: "pear", description: "delish", unit_price: 4000, merchant_id: 222, created_at: "2017-01-11 11:51:37 UTC")
        Item.create!(name: "apple1", description: "yum", unit_price: 2000, merchant_id: 123, created_at: "2016-01-11 11:51:37 UTC")
        Item.create!(name: "pear1", description: "delish", unit_price: 4000, merchant_id: 222, created_at: "2017-01-11 11:51:37 UTC")

        expect(Item.average_price).to eq(30)
      end
    end
  end

  describe "validations" do
    it "it is invalid without a name" do
      item = Item.create(description: "description", unit_price: 10, merchant_id: 100)

      expect(item).to_not be_valid
    end

    it "it is invalid without a description" do
      item = Item.create(name: "name", unit_price: 10, merchant_id: 100)

      expect(item).to_not be_valid
    end

    it "it is invalid without a unit_price" do
      item = Item.create(name: "name", description: "description", merchant_id: 100)

      expect(item).to_not be_valid
    end

    it "it is invalid without a merchant_id" do
      item = Item.create(name: "name", description: "description", unit_price: 10)

      expect(item).to_not be_valid
    end
  end
end
