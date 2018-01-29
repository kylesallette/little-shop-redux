require "./spec/spec_helper"

describe Category do
  describe "validations" do
      it "it is invalid without a name" do
        category = Category.create()

        expect(category).to_not be_valid
      end
    end
  end
