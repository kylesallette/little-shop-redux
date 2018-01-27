require "./spec/spec_helper"

describe Merchant do
  describe "validations" do
      it "it is invalid without a name" do
        merchant = Merchant.create()

        expect(merchant).to_not be_valid
      end
    end
  end
