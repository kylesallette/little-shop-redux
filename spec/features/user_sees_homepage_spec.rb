describe "a user visits homepage" do
  context "visit /" do
    it "user sees navbar links" do
      visit "/"

      expect(current_path).to eq("/")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
    end

    it "user can click home button" do
      visit "/"
      click_on("Home")

      expect(current_path).to eq("/")
    end

    it "user can click new merchant button" do
      visit "/"

      within("#merchant-dropdown") do
        click_on("Create a New Merchant")

        expect(current_path).to eq("/merchants/new")
      end
    end

    it "user can click edit merchant button" do
      visit "/"

      within("#merchant-dropdown") do
        click_on("Edit a Merchant")

        expect(current_path).to eq("/merchants/edit_input")
      end
    end

    it "user can click index merchant button" do
      visit "/"

      within("#merchant-dropdown") do
        click_on("View All Merchants")

        expect(current_path).to eq("/merchants")
      end
    end

    it "user can click show merchant button" do
      visit "/"

      within("#merchant-dropdown") do
        click_on("View a Merchant")

        expect(current_path).to eq("/merchants/show_input")
      end
    end
  end
end
