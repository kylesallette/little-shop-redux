require "./spec/spec_helper"

describe Merchant do
  describe "validations" do
      it "it is invalid without a merchant id" do
        merchant = Merchant.create(name: "Gary", created_at: Time.now, updated_at: Time.now)

        expect(merchant).to_not be_valid
      end

      it "it is invalid without a name" do
        merchant = Merchant.create(merchant_id: 1, created_at: Time.now, updated_at: Time.now)

        expect(merchant).to_not be_valid
      end

      it "it is invalid without a created at" do
        merchant = Merchant.create(merchant_id: 1, name: "Gary", updated_at: Time.now)

        expect(merchant).to_not be_valid
      end

      it "it is invalid without an updated at" do
        merchant = Merchant.create(merchant_id: 1, name: "Gary", created_at: Time.now)

        expect(merchant).to_not be_valid
      end

      it "it must be uniquely IDed" do
        merchant = Merchant.create(merchant_id: 1, name: "Gary", updated_at: Time.now, created_at: Time.now)
        merchant1 = Merchant.create(merchant_id: 1, name: "Billy", updated_at: Time.now, created_at: Time.now)

        expect(merchant1).to_not be_valid
      end
    end
  end
