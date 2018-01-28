require "./spec/spec_helper"

describe Item do
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
