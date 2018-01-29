describe "a user visits merchants edit input page" do
  context "visit /merchants/edit_input" do
    it "user can create a merchant and then search for that merchant and sees merchant's show page" do
      visit "/merchants/new"
      fill_in "number-box", with: "12334105"
      fill_in "text-box", with: "Example Merchant"
      click_on("submit-button")

      visit "/merchants/edit_input"
      fill_in "merchant_id_text_box", with: "12334105"
      click_on("Search")

      expect(current_path).to eq("/merchants/edit/")
    end

    it "user sees navbar links" do
      visit "/merchants/edit_input"

      expect(current_path).to eq("/merchants/edit_input")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
    end

    it "user can click home button" do
      visit "/merchants/edit_input"
      click_on("Home")

      expect(current_path).to eq("/")
    end

    it "user can click new merchant button" do
      visit "/merchants/edit_input"

      within("#merchant-dropdown") do
        click_on("Create a New Merchant")

        expect(current_path).to eq("/merchants/new")
      end
    end

    it "user can click edit merchant button" do
      visit "/merchants/edit_input"

      within("#merchant-dropdown") do
        click_on("Edit a Merchant")

        expect(current_path).to eq("/merchants/edit_input")
      end
    end

    it "user can click index merchant button" do
      visit "/merchants/edit_input"

      within("#merchant-dropdown") do
        click_on("View All Merchants")

        expect(current_path).to eq("/merchants")
      end
    end

    it "user can click show merchant button" do
      visit "/merchants/edit_input"

      within("#merchant-dropdown") do
        click_on("View a Merchant")

        expect(current_path).to eq("/merchants/show_input")
      end
    end
  end
end
