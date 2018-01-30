require 'spec_helper'

describe "user visits items dashboard" do
  it "sees item count" do
    Item.create!(name: "apple", description: "yum", unit_price: 20, merchant_id: 123)
    Item.create!(name: "pear", description: "yumyum", unit_price: 30, merchant_id: 222)

    visit "/items-dashboard"

    expect(page.status_code).to eq(200)
    expect(page).to have_content("2")

  end
end
